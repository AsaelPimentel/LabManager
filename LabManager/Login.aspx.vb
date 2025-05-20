Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnIniciarSesion_Click(sender As Object, e As EventArgs) Handles btnIniciarSesion.Click

        ' Verifica si el campo de usuario está vacío
        If txtUsuario.Text = "" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese su usuario');", True)
            txtUsuario.Focus()
        Else
            ' Verifica si el campo de contraseña está vacío
            If txtContrasena.Text = "" Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Ingrese su contraseña');", True)
                txtContrasena.Focus()
            Else
                ' Realiza la consulta para obtener los datos del usuario
                Dim dv As DataView = DirectCast(DS_Login.Select(DataSourceSelectArguments.Empty), DataView)

                ' Si se encuentra el usuario en la base de datos
                If dv IsNot Nothing And dv.Count <> 0 Then
                    ' Verifica si el rol es 1 o 2 y asigna el valor correspondiente a la sesión
                    If dv.Table.Rows(0)("id_rol").ToString().Trim() = "1" Then
                        ' Si el rol es 1, asigna "Administrador"
                        Session("Rol") = "1"
                    ElseIf dv.Table.Rows(0)("id_rol").ToString().Trim() = "2" Then
                        ' Si el rol es 2, asigna "Becario"
                        Session("Rol") = "2"
                    End If
                    ' Guardar el nombre del usuario en la sesión
                    Session("nombre") = dv.Table.Rows(0)("nombre").ToString().Trim()
                    ' Redirige a la página principal
                    Response.Redirect("default.aspx")
                Else
                    ' Si el usuario no se encuentra, muestra un mensaje de error
                    Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Usuario o contraseña incorrectos');", True)
                End If
            End If
        End If
    End Sub

End Class