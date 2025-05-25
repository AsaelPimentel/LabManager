Imports System.Data.SqlClient
Imports System.Configuration

Public Class Lab5
    Inherits System.Web.UI.Page

    Private Sub CargarComputadoras()
        Dim cs As String = ConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString
        Using con As New SqlConnection(cs)
            Dim cmd As New SqlCommand("SELECT id_computadora, nombre_equipo FROM Computadoras WHERE id_laboratorio = 5", con)
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            DdlComputadora.DataSource = reader
            DdlComputadora.DataTextField = "nombre_equipo"
            DdlComputadora.DataValueField = "id_computadora"
            DdlComputadora.DataBind()
        End Using
        DdlComputadora.Items.Insert(0, New ListItem("--Selecciona una computadora--", "0"))
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rol") Is Nothing Then
            Response.Redirect("login.aspx")
        End If

        If Not IsPostBack Then
            CargarComputadoras()
            GV_Lab5.Visible = False
            GV_PCsLab5.Visible = False
        End If
    End Sub

    Protected Sub DdlComputadora_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DdlComputadora.SelectedIndexChanged
        MostrarGrids()
    End Sub

    Protected Sub DdlGridview_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DdlGridview.SelectedIndexChanged
        MostrarGrids()
    End Sub

    Private Sub MostrarGrids()
        Dim compValida As Boolean = DdlComputadora.SelectedValue <> "0"
        Dim vistaSeleccionada As String = DdlGridview.SelectedValue

        GV_Lab5.Visible = False
        GV_PCsLab5.Visible = False

        If Not compValida Then
            Exit Sub
        End If

        If vistaSeleccionada = "1" Then
            GV_Lab5.Visible = True
            GV_Lab5.DataBind()
        ElseIf vistaSeleccionada = "2" Then
            GV_PCsLab5.Visible = True
            GV_PCsLab5.DataBind()
        End If
    End Sub

End Class
