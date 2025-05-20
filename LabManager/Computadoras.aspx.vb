Imports System.Data.SqlClient
Imports System.Web.Configuration

Public Class Computadoras
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rol") = Nothing Then
            Response.Redirect("login.aspx")
        End If
        If Session("Rol") <> 1 Then
            Response.Redirect("Default.aspx")
        End If
        If Not IsPostBack Then
            AplicarFiltro()
        End If
    End Sub
    Protected Sub btnFiltrarEstado_Click(sender As Object, e As EventArgs) Handles btnFiltrarEstado.Click
        AplicarFiltro()
    End Sub

    Protected Sub btnFiltrarLaboratorio_Click(sender As Object, e As EventArgs) Handles btnFiltrarLaboratorio.Click
        AplicarFiltro()
    End Sub

    Private Sub AplicarFiltro()
        Dim idEstado As String = ddlFiltroEstado.SelectedValue
        Dim idLaboratorio As String = ddlFiltroLaboratorio.SelectedValue

        ' Si están vacíos, usa DbNull para que SQL los interprete como NULL
        DS_Computadoras.SelectParameters("id_estado").DefaultValue = If(String.IsNullOrEmpty(idEstado), Nothing, idEstado)
        DS_Computadoras.SelectParameters("id_laboratorio").DefaultValue = If(String.IsNullOrEmpty(idLaboratorio), Nothing, idLaboratorio)

        GV_Computadoras.DataBind()
    End Sub
    Protected Sub BtnGuardarEquipo_Click(sender As Object, e As EventArgs) Handles BtnGuardarEquipo.Click
        DS_Computadoras.Insert()

        ' Limpiar los campos del formulario
        txtNombreEquipo.Text = ""
        txtFechaIngreso.Text = ""
        ddlEstadoEquipo.ClearSelection()
        ddlLaboratorio.ClearSelection()
    End Sub
    Protected Sub GV_Computadoras_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GV_Computadoras.RowCommand
        If e.CommandName = "Eliminar" Then
            ' Obtiene el ID del laboratorio desde el CommandArgument
            Dim idcomputadora As Integer = Convert.ToInt32(e.CommandArgument)
            ' Actualiza el estado del laboratorio a 4 (eliminado)
            Dim cmd As New SqlCommand("UPDATE computadoras SET id_estado = 4 WHERE id_computadora = @id_computadora", New SqlConnection(WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString))
            cmd.Parameters.AddWithValue("@id_computadora", idcomputadora)
            cmd.Connection.Open()
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
            ' Recargar los datos después de la eliminación
            GV_Computadoras.DataBind()
        End If
        If e.CommandName = "Editar" Then
            'hago visible el panel para la actualizacion
            PanelActualizarComputadora.Visible = True
            ' Obtiene el ID del laboratorio desde el CommandArgument
            Dim idcomputadora As Integer = Convert.ToInt32(e.CommandArgument)

            Dim connStr As String = WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString
            Using conn As New SqlConnection(connStr)
                Dim cmd As New SqlCommand("SELECT id_computadora, id_laboratorio, nombre_equipo, fecha_ingreso, id_estado FROM computadoras WHERE id_computadora = @id", conn)
                cmd.Parameters.AddWithValue("@id", idcomputadora)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    txtIdComputadoraUp.Text = reader("id_computadora").ToString()
                    ddlLaboratorioUp.SelectedValue = reader("id_laboratorio").ToString()
                    txtNombreEquipoUp.Text = reader("nombre_equipo").ToString()
                    txtFechaIngresoUp.Text = Convert.ToDateTime(reader("fecha_ingreso")).ToString("yyyy-MM-dd")
                    ddlEstadoComputadoraUp.SelectedValue = reader("id_estado").ToString()
                End If
                reader.Close()
            End Using
        End If
    End Sub

    Protected Sub btnCancelarUp_Click(sender As Object, e As EventArgs) Handles btnCancelarUp.Click
        txtIdComputadoraUp.Text = ""
        ddlLaboratorioUp.ClearSelection()
        txtNombreEquipoUp.Text = ""
        txtFechaIngresoUp.Text = ""
        ddlEstadoComputadoraUp.ClearSelection()
        PanelActualizarComputadora.Visible = False
    End Sub

    Protected Sub btnActualizarComputadora_Click(sender As Object, e As EventArgs) Handles btnActualizarComputadora.Click
        DS_ActualizarPC.Update()
        GV_Computadoras.DataBind()
        txtIdComputadoraUp.Text = ""
        ddlLaboratorioUp.ClearSelection()
        txtNombreEquipoUp.Text = ""
        txtFechaIngresoUp.Text = ""
        ddlEstadoComputadoraUp.ClearSelection()
        PanelActualizarComputadora.Visible = False
    End Sub
End Class