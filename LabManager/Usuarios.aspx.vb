Imports System.Data.SqlClient
Imports System.Web.Configuration

Public Class Usuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rol") = Nothing Then
            Response.Redirect("login.aspx")
        End If
        If Session("Rol") <> 1 Then
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub BtnGuardarUsuario_Click(sender As Object, e As EventArgs) Handles BtnGuardarUsuario.Click
        DS_Usuarios.Insert()
        txtNombre.Text = ""
        txtCorreo.Text = ""
        txtUsuario.Text = ""
        txtContrasena.Text = ""
        ddlRol.ClearSelection()
        ddlEstadoUsuario.ClearSelection()
    End Sub
    Protected Sub GV_Usuarios_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GV_Usuarios.RowCommand
        If e.CommandName = "Eliminar" Then
            Dim idUsuario As Integer = Convert.ToInt32(e.CommandArgument)
            Dim cmd As New SqlCommand("UPDATE Usuarios SET id_estado = 4 WHERE id_usuario = @id_usuario", New SqlConnection(WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString))
            cmd.Parameters.AddWithValue("@id_usuario", idUsuario)
            cmd.Connection.Open()
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()

            GV_Usuarios.DataBind()
        End If
        If e.CommandName = "Editar" Then
            Dim idUsuario As Integer = Convert.ToInt32(e.CommandArgument)
            Dim connStr As String = WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString
            Using conn As New SqlConnection(connStr)
                Dim cmd As New SqlCommand("SELECT id_usuario, nombre, correo, usuario, contrasena, id_rol, id_estado FROM Usuarios WHERE id_usuario = @id_usuario", conn)
                cmd.Parameters.AddWithValue("@id_usuario", idUsuario)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    ddlRolUp.DataBind() ' <- Importante
                    ddlEstadoUsuarioUp.DataBind() ' <- Importante
                    txtIdUsuarioUp.Text = reader("id_usuario").ToString()
                    txtNombreUp.Text = reader("nombre").ToString()
                    txtCorreoUp.Text = reader("correo").ToString()
                    txtUsuarioUp.Text = reader("usuario").ToString()
                    txtContrasenaUp.TextMode = TextBoxMode.SingleLine
                    txtContrasenaUp.Text = reader("contrasena").ToString()
                    ddlRolUp.SelectedValue = reader("id_rol").ToString()
                    ddlEstadoUsuarioUp.SelectedValue = reader("id_estado").ToString()
                End If
                reader.Close()
            End Using
            ' Mostrar el panel de actualización
            PanelActualizarUsuario.Visible = True
        End If
    End Sub

    Protected Sub btnCancelarEdicionUsuario_Click(sender As Object, e As EventArgs) Handles btnCancelarEdicionUsuario.Click
        txtIdUsuarioUp.Text = ""
        txtNombreUp.Text = ""
        txtCorreoUp.Text = ""
        txtUsuarioUp.Text = ""
        txtContrasenaUp.Text = ""
        ddlRolUp.ClearSelection()
        ddlEstadoUsuarioUp.ClearSelection()

        PanelActualizarUsuario.Visible = False
    End Sub

    Protected Sub btnGuardarEdicionUsuario_Click(sender As Object, e As EventArgs) Handles btnGuardarEdicionUsuario.Click
        DS_ActualizarUsuario.Update()

        txtIdUsuarioUp.Text = ""
        txtNombreUp.Text = ""
        txtCorreoUp.Text = ""
        txtUsuarioUp.Text = ""
        txtContrasenaUp.Text = ""
        ddlRolUp.ClearSelection()
        ddlEstadoUsuarioUp.ClearSelection()

        PanelActualizarUsuario.Visible = False
        GV_Usuarios.DataBind()
    End Sub
End Class