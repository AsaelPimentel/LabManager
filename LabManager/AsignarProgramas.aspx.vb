Imports System.Data.SqlClient
Imports System.Web.Configuration
Public Class AsignarProgramas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rol") = Nothing Then
            Response.Redirect("login.aspx")
        End If
        If Session("Rol") <> 1 Then
            Response.Redirect("Default.aspx")
        End If
    End Sub

    Protected Sub ddlLaboratorio_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlLaboratorio.SelectedIndexChanged
        Dim script As String = "setTimeout(function() { $('#exampleModal').modal('show'); }, 30);"
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "abrirModal", script, True)
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        DS_Asignaciones.Insert()

        ddlLaboratorio.ClearSelection()
        ddlComputadora.ClearSelection()
        txtFecha.Text = ""
        ddlEstado.ClearSelection()

        GV_Asignaciones.DataBind()
    End Sub

    Protected Sub GV_Asignaciones_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GV_Asignaciones.RowCommand
        If e.CommandName = "Eliminar" Then
            Dim idAsignacion As Integer = Convert.ToInt32(e.CommandArgument)
            ' Actualiza el estado del laboratorio a 4 (eliminado)
            Dim cmd As New SqlCommand("UPDATE Computadoras_Programas SET id_estado = 4 WHERE id_asignacion = @id_asignacion", New SqlConnection(WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString))
            cmd.Parameters.AddWithValue("@id_asignacion", idAsignacion)
            cmd.Connection.Open()
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()

            ' Recargar los datos después de la eliminación
            GV_Asignaciones.DataBind()
        End If
        If e.CommandName = "Editar" Then
            PnlActulizarAsignacion.Visible = True

            Dim idAsignacion As Integer = Convert.ToInt32(e.CommandArgument)
            Dim connStr As String = WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString

            Using conn As New SqlConnection(connStr)
                Dim cmd As New SqlCommand("SELECT id_asignacion, id_computadora, id_programa, fecha_instalacion, id_estado FROM Computadoras_Programas WHERE id_asignacion = @id", conn)
                cmd.Parameters.AddWithValue("@id", idAsignacion)
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    txtIdAsignacion.Text = reader("id_asignacion").ToString()
                    ddlEditComputadora.SelectedValue = reader("id_computadora").ToString()
                    ddlEditPrograma.SelectedValue = reader("id_programa").ToString()
                    txtEditFecha.Text = Convert.ToDateTime(reader("fecha_instalacion")).ToString("yyyy-MM-dd")
                    ddlEditEstado.SelectedValue = reader("id_estado").ToString()

                    ' Opcional: podrías derivar el laboratorio desde la computadora si se requiere.
                End If
                reader.Close()
            End Using
            GV_Asignaciones.DataBind()
        End If
    End Sub

    Protected Sub btnEditCancelar_Click(sender As Object, e As EventArgs) Handles btnEditCancelar.Click
        ddlEditComputadora.ClearSelection()
        txtEditFecha.Text = ""
        ddlEditEstado.ClearSelection()
        PnlActulizarAsignacion.Visible = False
    End Sub

    Protected Sub btnEditGuardar_Click(sender As Object, e As EventArgs) Handles btnEditGuardar.Click
        DS_EditAsignaciones.Update()
        ddlEditComputadora.ClearSelection()
        txtEditFecha.Text = ""
        ddlEditEstado.ClearSelection()
        PnlActulizarAsignacion.Visible = False
        GV_Asignaciones.DataBind()
    End Sub

End Class