Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Web.UI.WebControls.Expressions
Public Class Mantenimientos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rol") = Nothing Then
            Response.Redirect("login.aspx")
        End If
    End Sub
    Protected Sub GV_Mantenimiento_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' Verificamos el rol del usuario
            If Session("Rol") IsNot Nothing AndAlso Convert.ToInt32(Session("Rol")) <> 1 Then
                ' Buscar el botón Eliminar y ocultarlo si no es rol 1
                Dim btnEliminar As Button = CType(e.Row.FindControl("BtnEliminar"), Button)
                If btnEliminar IsNot Nothing Then
                    btnEliminar.Visible = False
                End If
            End If
        End If
    End Sub

    Protected Sub BtnGuardarMantenimiento_Click(sender As Object, e As EventArgs) Handles BtnGuardarMantenimiento.Click
        DS_Mantenimientos.Insert()
        ddlComputadora.ClearSelection()
        txtTipo.Text = ""
        txtDescripcion.Text = ""
        txtFechaProgramada.Text = ""
        txtFechaRealizacion.Text = ""
        txtTecnico.Text = ""
        ddlEstadoMantenimiento.ClearSelection()
        GV_Mantenimiento.DataBind()
    End Sub
    Protected Sub GV_Mantenimiento_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GV_Mantenimiento.RowCommand
        If e.CommandName = "Eliminar" Then
            Dim idmantenimiento As Integer = Convert.ToInt32(e.CommandArgument)
            Dim cmd As New SqlCommand("DELETE Mantenimientos WHERE id_mantenimiento = @id_mantenimiento", New SqlConnection(WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString))
            cmd.Parameters.AddWithValue("@id_mantenimiento", idmantenimiento)
            cmd.Connection.Open()
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
            ' Recargar los datos después de la eliminación
            GV_Mantenimiento.DataBind()
        End If
        If e.CommandName = "Editar" Then
            PanelActualizarMantenimiento.Visible = True

            Dim idMantenimiento As Integer = Convert.ToInt32(e.CommandArgument)

            Dim connStr As String = WebConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString
            Using conn As New SqlConnection(connStr)
                Dim query As String = "SELECT * FROM Mantenimientos WHERE id_mantenimiento = @id"
                Using cmd As New SqlCommand(query, conn)
                    cmd.Parameters.AddWithValue("@id", idMantenimiento)
                    conn.Open()
                    Using reader As SqlDataReader = cmd.ExecuteReader()
                        If reader.Read() Then
                            txtIdMantenimientoUp.Text = idMantenimiento.ToString()
                            ddlIdComputadoraUp.Text = reader("id_computadora").ToString()
                            txtTipoUp.Text = reader("tipo").ToString()
                            txtDescripcionUp.Text = reader("descripcion").ToString()
                            txtFechaProgramadaUp.Text = Convert.ToDateTime(reader("fecha_programada")).ToString("yyyy-MM-dd")
                            txtFechaRealizacionUp.Text = Convert.ToDateTime(reader("fecha_realizacion")).ToString("yyyy-MM-dd")
                            txtTecnicoResponsableUp.Text = reader("tecnico_responsable").ToString()
                            ddlEstadoMantenimientoUp.Text = reader("estado_mantenimiento").ToString()
                        End If
                    End Using
                End Using
            End Using
        End If
    End Sub

    Protected Sub btnActualizarMantenimiento_Click(sender As Object, e As EventArgs) Handles btnActualizarMantenimiento.Click
        DS_Mantenimientos.Update()
        txtIdMantenimientoUp.Text = ""
        ddlIdComputadoraUp.ClearSelection()
        txtTipoUp.Text = ""
        txtDescripcionUp.Text = ""
        txtFechaProgramadaUp.Text = ""
        txtFechaRealizacionUp.Text = ""
        txtTecnicoResponsableUp.Text = ""
        ddlEstadoMantenimientoUp.ClearSelection()
        PanelActualizarMantenimiento.Visible = False
        GV_Mantenimiento.DataBind()
    End Sub

    Protected Sub btnCancelarMantenimiento_Click(sender As Object, e As EventArgs) Handles btnCancelarMantenimiento.Click
        txtIdMantenimientoUp.Text = ""
        ddlIdComputadoraUp.ClearSelection()
        txtTipoUp.Text = ""
        txtDescripcionUp.Text = ""
        txtFechaProgramadaUp.Text = ""
        txtFechaRealizacionUp.Text = ""
        txtTecnicoResponsableUp.Text = ""
        ddlEstadoMantenimientoUp.ClearSelection()
        PanelActualizarMantenimiento.Visible = False
    End Sub
End Class