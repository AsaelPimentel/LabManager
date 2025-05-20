Public Class Lab2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rol") = Nothing Then
            Response.Redirect("login.aspx")
        End If
    End Sub

    Protected Sub DdlGridview_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DdlGridview.SelectedIndexChanged
        If DdlGridview.SelectedValue = 0 Then
            GV_Lab2.Visible = False
            GV_PCsLab2.Visible = False
        End If
        If DdlGridview.SelectedValue = 1 Then
            GV_Lab2.Visible = True
            GV_PCsLab2.Visible = False
        End If
        If DdlGridview.SelectedValue = 2 Then
            GV_Lab2.Visible = False
            GV_PCsLab2.Visible = True
        End If
    End Sub
End Class