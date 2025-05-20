Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnCerrarSesion_Click(sender As Object, e As EventArgs) Handles btnCerrarSesion.Click
        Session.Remove("Rol") 'Elimina la variable específica de la sesión
        Session.Abandon() 'Abandona la sesión
        Response.Redirect("~/login.aspx") ' Aquí puedes poner la ruta donde quieres redirigir
    End Sub

End Class