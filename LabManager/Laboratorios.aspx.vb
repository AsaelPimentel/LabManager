Imports System.Data.SqlClient
Imports System.Web.Configuration

Public Class Laboratorios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rol") = Nothing Then
            Response.Redirect("login.aspx")
        End If
        If Session("Rol") <> 1 Then
            Response.Redirect("Default.aspx")
        End If
        If Not IsPostBack Then
            CargarEstados()
            CargarEstadosFiltro() ' ¡Este es clave!
        End If
    End Sub
    Private Sub CargarEstadosFiltro()
        Dim ddlFiltro As DropDownList = CType(Me.FindControl("ddlFiltroEstado"), DropDownList)

        If ddlFiltro IsNot Nothing Then
            Dim connStr As String = WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString
            Using conn As New SqlConnection(connStr)
                Dim cmd As New SqlCommand("SELECT id_estado, nombre_estado FROM Estados", conn)
                conn.Open()
                ddlFiltro.DataSource = cmd.ExecuteReader()
                ddlFiltro.DataTextField = "nombre_estado"
                ddlFiltro.DataValueField = "id_estado"
                ddlFiltro.DataBind()
            End Using

            ddlFiltro.Items.Insert(0, New ListItem("Todos los estados", ""))
        End If
    End Sub
    Private Sub CargarEstados()
        Dim ddlEstado As DropDownList = CType(PanelModal.FindControl("ddlEstado"), DropDownList)

        If ddlEstado IsNot Nothing Then
            Dim connStr As String = WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString
            Dim query As String = "SELECT id_estado, nombre_estado FROM Estados"

            Using conn As New SqlConnection(connStr)
                Using cmd As New SqlCommand(query, conn)
                    conn.Open()
                    ddlEstado.DataSource = cmd.ExecuteReader()
                    ddlEstado.DataTextField = "nombre_estado"
                    ddlEstado.DataValueField = "id_estado"
                    ddlEstado.DataBind()
                End Using
            End Using

            ' Opcional: agrega de nuevo la opción inicial
            ddlEstado.Items.Insert(0, New ListItem("Seleccione un estado...", ""))
        Else
            ' Para depuración
            Throw New Exception("ddlEstado no encontrado")
        End If
    End Sub

    Protected Sub BtnGuardar_Click(sender As Object, e As EventArgs) Handles BtnGuardar.Click
        ' Guardar los datos usando el SqlDataSource
        DS_Laboratorios.Insert()

        ' Recargar los datos del GridView
        GV_Laboratorios.DataBind()

        ' Limpiar los campos del formulario
        txtNombre.Text = ""
        txtUbicacion.Text = ""
        txtCapacidad.Text = ""
        ddlEstado.ClearSelection()

        ' Cerrar el modal con un script
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "closeModal", "$('#exampleModal').modal('hide');", True)
    End Sub

    Protected Sub GV_Laboratorios_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GV_Laboratorios.RowCommand
        If e.CommandName = "Eliminar" Then
            ' Obtiene el ID del laboratorio desde el CommandArgument
            Dim idLaboratorio As Integer = Convert.ToInt32(e.CommandArgument)

            ' Actualiza el estado del laboratorio a 4 (eliminado)
            Dim cmd As New SqlCommand("UPDATE Laboratorios SET id_estado = 4 WHERE id_laboratorio = @id_laboratorio", New SqlConnection(WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString))
            cmd.Parameters.AddWithValue("@id_laboratorio", idLaboratorio)
            cmd.Connection.Open()
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()

            ' Recargar los datos después de la eliminación
            GV_Laboratorios.DataBind()
        End If
        If e.CommandName = "Editar" Then
            Panel1.Visible = True
            Dim idLaboratorio As Integer = Convert.ToInt32(e.CommandArgument)

            Dim connStr As String = WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString
            Using conn As New SqlConnection(connStr)
                Dim cmd As New SqlCommand("SELECT id_laboratorio, nombre, ubicacion, capacidad_maxima, id_estado FROM Laboratorios WHERE id_laboratorio = @id", conn)
                cmd.Parameters.AddWithValue("@id", idLaboratorio)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    txtIdUp.Text = reader("id_laboratorio").ToString()
                    txtNombreUp.Text = reader("nombre").ToString()
                    txtUbicacionUp.Text = reader("ubicacion").ToString()
                    txtCapacidadUp.Text = reader("capacidad_maxima").ToString()
                    ddlEstadoUp.SelectedValue = reader("id_estado").ToString()
                End If
                reader.Close()
            End Using
        End If
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Panel1.Visible = False
        txtIdUp.Text = ""
        txtNombreUp.Text = ""
        txtUbicacionUp.Text = ""
        txtCapacidadUp.Text = ""
        ddlEstadoUp.ClearSelection()
    End Sub

    Protected Sub BtnActualizar_Click(sender As Object, e As EventArgs) Handles BtnActualizar.Click
        DS_ActualizarLab.Update()
        GV_Laboratorios.DataBind()
        txtIdUp.Text = ""
        txtNombreUp.Text = ""
        txtUbicacionUp.Text = ""
        txtCapacidadUp.Text = ""
        ddlEstadoUp.ClearSelection()
        Panel1.Visible = False
    End Sub
    Protected Sub ddlFiltroEstado_SelectedIndexChanged(sender As Object, e As EventArgs)
        GV_Laboratorios.DataBind()
    End Sub
End Class