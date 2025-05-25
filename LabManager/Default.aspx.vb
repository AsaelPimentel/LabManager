Imports System.Data.SqlClient

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("Rol") = Nothing Then
            Response.Redirect("login.aspx")
        End If
        Me.DataBind()

        If Not IsPostBack Then
            Dim connStr As String = ConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString

            Using conn As New SqlConnection(connStr)
                conn.Open()

                lblLaboratorios.Text = GetCount(conn, "Laboratorios").ToString()
                lblComputadoras.Text = GetCount(conn, "Computadoras").ToString()
                lblComponentes.Text = GetCount(conn, "Componentes").ToString()
                lblProgramas.Text = GetCount(conn, "Programas").ToString()
            End Using
        End If

        If Not IsPostBack Then
            If Session("Rol") IsNot Nothing AndAlso Convert.ToInt32(Session("Rol")) = 2 Then
                btnVerMantenimientos.Visible = True
            End If
        End If
    End Sub

    Private Function GetCount(conn As SqlConnection, tableName As String) As Integer
        Dim cmd As New SqlCommand("SELECT COUNT(*) FROM " & tableName, conn)
        Return Convert.ToInt32(cmd.ExecuteScalar())
    End Function
End Class