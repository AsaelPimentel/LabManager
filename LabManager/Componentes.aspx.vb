Imports System.Data.SqlClient
Imports System.Web.Configuration
Public Class Componentes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rol") = Nothing Then
            Response.Redirect("login.aspx")
        End If
        If Session("Rol") <> 1 Then
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub BtnGuardar_Click(sender As Object, e As EventArgs) Handles BtnGuardar.Click
        DS_Componente.Insert()
        GV_Componentes.DataBind()
    End Sub

    Protected Sub GV_Componentes_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GV_Componentes.RowCommand
        If e.CommandName = "Eliminar" Then
            ' Obtiene el ID del laboratorio desde el CommandArgument
            Dim idLaboratorio As Integer = Convert.ToInt32(e.CommandArgument)

            ' Actualiza el estado del laboratorio a 4 (eliminado)
            Dim cmd As New SqlCommand("UPDATE Componentes SET id_estado = 4 WHERE id_componente = @id_componente", New SqlConnection(WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString))
            cmd.Parameters.AddWithValue("@id_componente", idLaboratorio)
            cmd.Connection.Open()
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()

            ' Recargar los datos después de la eliminación
            GV_Componentes.DataBind()
        End If
        If e.CommandName = "Editar" Then
            PanelActualizarComponente.Visible = True

            Dim idComponente As Integer = Convert.ToInt32(e.CommandArgument)

            ' Vincula los DropDownList antes de asignar valores
            ddlComputadoraUp.DataBind()
            ddlEstadoUp.DataBind()

            Dim connStr As String = WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString
            Using conn As New SqlConnection(connStr)
                Dim cmd As New SqlCommand("SELECT id_componente, id_computadora, tipo, marca, modelo, numero_serie, capacidad, tipo_almacenamiento, id_estado FROM Componentes WHERE id_componente = @id", conn)
                cmd.Parameters.AddWithValue("@id", idComponente)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    txtIdComponenteUp.Text = reader("id_componente").ToString()
                    ddlComputadoraUp.SelectedValue = reader("id_computadora").ToString()
                    txtTipoUp.Text = reader("tipo").ToString()
                    txtMarcaUp.Text = reader("marca").ToString()
                    txtModeloUp.Text = reader("modelo").ToString()
                    txtSerieUp.Text = reader("numero_serie").ToString()
                    txtCapacidadUp.Text = reader("capacidad").ToString()
                    txtTipoAlmacenamientoUp.Text = reader("tipo_almacenamiento").ToString()
                    ddlEstadoUp.SelectedValue = reader("id_estado").ToString()
                End If
                reader.Close()
            End Using
        End If
    End Sub

    Protected Sub btnGuardarEdicion_Click(sender As Object, e As EventArgs) Handles btnGuardarEdicion.Click
        DS_ComponenteUp.Update()
        PanelActualizarComponente.Visible = False
        txtIdComponenteUp.Text = ""
        ddlComputadoraUp.ClearSelection()
        txtTipoUp.Text = ""
        txtMarcaUp.Text = ""
        txtModeloUp.Text = ""
        txtSerieUp.Text = ""
        txtCapacidadUp.Text = ""
        txtTipoAlmacenamientoUp.Text = ""
        ddlEstadoUp.ClearSelection()
        GV_Componentes.DataBind()
    End Sub

    Protected Sub btnCancelarEdicion_Click(sender As Object, e As EventArgs) Handles btnCancelarEdicion.Click
        PanelActualizarComponente.Visible = False
        txtIdComponenteUp.Text = ""
        ddlComputadoraUp.ClearSelection()
        txtTipoUp.Text = ""
        txtMarcaUp.Text = ""
        txtModeloUp.Text = ""
        txtSerieUp.Text = ""
        txtCapacidadUp.Text = ""
        txtTipoAlmacenamientoUp.Text = ""
        ddlEstadoUp.ClearSelection()
    End Sub
End Class