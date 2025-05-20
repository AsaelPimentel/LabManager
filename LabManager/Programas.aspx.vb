Imports System.Data.SqlClient
Imports System.Web.Configuration
Public Class Programas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rol") = Nothing Then
            Response.Redirect("login.aspx")
        End If
        If Session("Rol") <> 1 Then
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub BtnGuardarPrograma_Click(sender As Object, e As EventArgs) Handles BtnGuardarPrograma.Click
        DS_Programas.Insert()
        GV_Programas.DataBind()
    End Sub

    Protected Sub GV_Programas_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GV_Programas.RowCommand
        If e.CommandName = "Eliminar" Then
            Dim idPrograma As Integer = Convert.ToInt32(e.CommandArgument)
            Dim cmd As New SqlCommand("UPDATE programas SET id_estado = 4 WHERE id_programa = @id_programa", New SqlConnection(WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString))
            cmd.Parameters.AddWithValue("@id_programa", idPrograma)
            cmd.Connection.Open()
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()

            GV_Programas.DataBind()
        End If

        If e.CommandName = "Editar" Then
            PanelActualizarPrograma.Visible = True
            Dim idPrograma As Integer = Convert.ToInt32(e.CommandArgument)
            Dim connStr As String = WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString
            Using conn As New SqlConnection(connStr)
                Dim cmd As New SqlCommand("SELECT id_programa, nombre, version_programa, licencia, descripcion, id_estado FROM Programas WHERE id_programa = @id", conn)
                cmd.Parameters.AddWithValue("@id", idPrograma)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    txtIdProgramaUp.Text = reader("id_programa").ToString()
                    txtNombreProgramaUp.Text = reader("nombre").ToString()
                    txtVersionProgramaUp.Text = reader("version_programa").ToString()
                    txtLicenciaUp.Text = reader("licencia").ToString()
                    txtDescripcionUp.Text = reader("descripcion").ToString()
                    ddlEstadoProgramaUp.SelectedValue = reader("id_estado").ToString()
                End If
                reader.Close()
            End Using

        End If
    End Sub

    Protected Sub btnCancelarEdicionPrograma_Click(sender As Object, e As EventArgs) Handles btnCancelarEdicionPrograma.Click
        PanelActualizarPrograma.Visible = False
        txtIdProgramaUp.Text = ""
        txtNombreProgramaUp.Text = ""
        txtVersionProgramaUp.Text = ""
        txtLicenciaUp.Text = ""
        txtDescripcionUp.Text = ""
        ddlEstadoProgramaUp.ClearSelection()
    End Sub

    Protected Sub btnGuardarEdicionPrograma_Click(sender As Object, e As EventArgs) Handles btnGuardarEdicionPrograma.Click
        DS_ProgramaUp.Update()
        PanelActualizarPrograma.Visible = False
        txtIdProgramaUp.Text = ""
        txtNombreProgramaUp.Text = ""
        txtVersionProgramaUp.Text = ""
        txtLicenciaUp.Text = ""
        txtDescripcionUp.Text = ""
        ddlEstadoProgramaUp.ClearSelection()
        GV_Programas.DataBind()
    End Sub
End Class