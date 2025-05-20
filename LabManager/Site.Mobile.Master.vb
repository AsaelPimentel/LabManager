Public Class Site_Mobile
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnCerrarSesion_Click(ByVal sender As Object, ByVal e As EventArgs)
        ' Aquí agregas la lógica para cerrar la sesión, por ejemplo:
        ' Session.Abandon() ' Esto cierra la sesión del usuario.
        ' Response.Redirect("~/Login.aspx") ' Redirige al usuario a la página de inicio de sesión.

        ' Si quieres simplemente cerrar la sesión:
        Session.Abandon()
        Response.Redirect("~/Login.aspx")
    End Sub
End Class