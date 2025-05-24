Imports System.Data.SqlClient
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf

Public Class Reportes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Rol") = Nothing Then
            Response.Redirect("login.aspx")
        End If
    End Sub
    Protected Sub btnGenerarPDF_ServerClick(sender As Object, e As EventArgs)
        Dim tipoReporte As String = ddlTipoReporte.SelectedValue
        Select Case tipoReporte
            Case "computadoras"
                GenerarReporteComputadoras()
            Case "mantenimientos"
                GenerarReporteMantenimientos()
            Case "programas"
                GenerarReporteProgramas()
        End Select
    End Sub

    Private Sub GenerarReporteComputadoras()
        ' Aquí iría el código para generar el PDF de computadoras
        Dim doc As New Document(PageSize.A4.Rotate(), 40, 40, 80, 40)
        Dim ms As New MemoryStream()
        Dim writer As PdfWriter = PdfWriter.GetInstance(doc, ms)

        doc.Open()

        ' Agregar logo
        Dim logoPath As String = Server.MapPath("~/Img/logo.png")
        If File.Exists(logoPath) Then
            Dim logo As Image = Image.GetInstance(logoPath)
            logo.ScaleToFit(60.0F, 60.0F)
            logo.Alignment = Element.ALIGN_LEFT
            doc.Add(logo)
        End If

        ' Título
        Dim titulo As New Paragraph("Reporte de Componentes por Computadora", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK))
        titulo.Alignment = Element.ALIGN_CENTER
        titulo.SpacingAfter = 20.0F
        doc.Add(titulo)

        ' Tabla
        Dim table As New PdfPTable(11)
        table.WidthPercentage = 100
        table.SetWidths({6, 12, 6, 6, 10, 10, 10, 10, 10, 10, 10})

        ' Encabezados
        Dim headers As String() = {
            "ID PC", "Nombre Equipo", "ID Lab", "ID Comp", "Tipo Comp.",
            "Marca", "Modelo", "N° Serie", "Capacidad", "Tipo Almacenamiento", "Estado"
        }

        For Each h As String In headers
            Dim cell As New PdfPCell(New Phrase(h, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 8)))
            cell.BackgroundColor = New BaseColor(220, 220, 220)
            cell.HorizontalAlignment = Element.ALIGN_CENTER
            table.AddCell(cell)
        Next

        ' Llenar con datos de la vista
        Dim connStr As String = ConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString
        Dim query As String = "SELECT * FROM vw_ComponentesPorComputadora"

        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand(query, conn)
            conn.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            While reader.Read()
                table.AddCell(reader("id_computadora").ToString())
                table.AddCell(reader("nombre_equipo").ToString())
                table.AddCell(reader("id_laboratorio").ToString())
                table.AddCell(reader("id_componente").ToString())
                table.AddCell(reader("tipo_componente").ToString())
                table.AddCell(reader("marca").ToString())
                table.AddCell(reader("modelo").ToString())
                table.AddCell(reader("numero_serie").ToString())
                table.AddCell(reader("capacidad").ToString())
                table.AddCell(reader("tipo_almacenamiento").ToString())
                table.AddCell(reader("estado_componente").ToString())
            End While
        End Using

        doc.Add(table)
        doc.Close()

        ' Descargar PDF
        Response.Clear()
        Response.ContentType = "application/pdf"
        Response.AddHeader("Content-Disposition", "attachment; filename=ReporteComputadoras.pdf")
        Response.OutputStream.Write(ms.ToArray(), 0, ms.ToArray().Length)
        Response.Flush()
        Response.End()

    End Sub

    Private Sub GenerarReporteMantenimientos()
        ' Aquí iría el código para generar el PDF de mantenimientos

        Dim doc As New Document(PageSize.A4, 40, 40, 80, 40)
        Dim ms As New MemoryStream()
        Dim writer As PdfWriter = PdfWriter.GetInstance(doc, ms)

        doc.Open()

        ' Agregar logo
        Dim logoPath As String = Server.MapPath("~/Img/logo.png")
        If File.Exists(logoPath) Then
            Dim logo As Image = Image.GetInstance(logoPath)
            logo.ScaleToFit(60.0F, 60.0F)
            logo.Alignment = Element.ALIGN_LEFT
            doc.Add(logo)
        End If

        ' Título
        Dim titulo As New Paragraph("Reporte de Mantenimientos", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK))
        titulo.Alignment = Element.ALIGN_CENTER
        titulo.SpacingAfter = 20.0F
        doc.Add(titulo)

        ' Tabla
        Dim table As New PdfPTable(9)
        table.WidthPercentage = 100
        table.SetWidths({10, 15, 12, 12, 10, 12, 10, 10, 9})

        ' Encabezados
        Dim headers As String() = {"ID", "Nombre Equipo", "Laboratorio", "Ubicación", "Estado", "Tipo Mantenimiento", "Fecha Programada", "Fecha Realización", "Técnico"}

        For Each h As String In headers
            Dim cell As New PdfPCell(New Phrase(h, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 10)))
            cell.BackgroundColor = New BaseColor(220, 220, 220)
            cell.HorizontalAlignment = Element.ALIGN_CENTER
            table.AddCell(cell)
        Next

        ' Llenar con datos de la vista
        Dim connStr As String = ConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString
        Dim query As String = "SELECT * FROM vw_ResumenComputadoras"

        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand(query, conn)
            conn.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            While reader.Read()
                table.AddCell(reader("id_computadora").ToString())
                table.AddCell(reader("nombre_equipo").ToString())
                table.AddCell(reader("laboratorio").ToString())
                table.AddCell(reader("ubicacion").ToString())
                table.AddCell(reader("estado_computadora").ToString())
                table.AddCell(reader("tipo_mantenimiento").ToString())
                table.AddCell(If(IsDBNull(reader("fecha_programada")), "", Convert.ToDateTime(reader("fecha_programada")).ToString("dd/MM/yyyy")))
                table.AddCell(If(IsDBNull(reader("fecha_realizacion")), "", Convert.ToDateTime(reader("fecha_realizacion")).ToString("dd/MM/yyyy")))
                table.AddCell(reader("tecnico_responsable").ToString())
            End While
        End Using

        doc.Add(table)
        doc.Close()

        ' Descargar PDF
        Response.Clear()
        Response.ContentType = "application/pdf"
        Response.AddHeader("Content-Disposition", "attachment; filename=ReporteComputadoras.pdf")
        Response.OutputStream.Write(ms.ToArray(), 0, ms.ToArray().Length)
        Response.Flush()
        Response.End()
    End Sub

    Private Sub GenerarReporteProgramas()
        ' Aquí iría el código para generar el PDF de programas
        Dim doc As New Document(PageSize.A4.Rotate(), 40, 40, 80, 40)
        Dim ms As New MemoryStream()
        Dim writer As PdfWriter = PdfWriter.GetInstance(doc, ms)

        doc.Open()

        ' Agregar logo
        Dim logoPath As String = Server.MapPath("~/Img/logo.png")
        If File.Exists(logoPath) Then
            Dim logo As Image = Image.GetInstance(logoPath)
            logo.ScaleToFit(60.0F, 60.0F)
            logo.Alignment = Element.ALIGN_LEFT
            doc.Add(logo)
        End If

        ' Título
        Dim titulo As New Paragraph("Reporte de Programas por Computadora y Laboratorio", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK))
        titulo.Alignment = Element.ALIGN_CENTER
        titulo.SpacingAfter = 20.0F
        doc.Add(titulo)

        ' Tabla
        Dim table As New PdfPTable(12)
        table.WidthPercentage = 100
        table.SetWidths({5, 6, 10, 10, 6, 10, 8, 6, 10, 6, 8, 15})

        ' Encabezados
        Dim headers As String() = {
            "ID Asignación", "ID Lab", "Nombre Lab", "Ubicación", "ID PC", "Nombre Equipo",
            "Fecha Instalación", "ID Programa", "Nombre Programa", "Versión", "Licencia", "Descripción"
        }

        For Each h As String In headers
            Dim cell As New PdfPCell(New Phrase(h, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 8)))
            cell.BackgroundColor = New BaseColor(220, 220, 220)
            cell.HorizontalAlignment = Element.ALIGN_CENTER
            table.AddCell(cell)
        Next

        ' Llenar con datos de la vista
        Dim connStr As String = ConfigurationManager.ConnectionStrings("CS_LabManager").ConnectionString
        Dim query As String = "SELECT * FROM Vista_ProgramasPorComputadoraYLaboratorio"

        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand(query, conn)
            conn.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            While reader.Read()
                table.AddCell(reader("id_asignacion").ToString())
                table.AddCell(reader("id_laboratorio").ToString())
                table.AddCell(reader("nombre_laboratorio").ToString())
                table.AddCell(reader("ubicacion").ToString())
                table.AddCell(reader("id_computadora").ToString())
                table.AddCell(reader("nombre_equipo").ToString())
                table.AddCell(If(IsDBNull(reader("fecha_instalacion")), "", Convert.ToDateTime(reader("fecha_instalacion")).ToString("dd/MM/yyyy")))
                table.AddCell(reader("id_programa").ToString())
                table.AddCell(reader("nombre_programa").ToString())
                table.AddCell(reader("version_programa").ToString())
                table.AddCell(reader("licencia").ToString())
                table.AddCell(reader("descripcion").ToString())
            End While
        End Using

        doc.Add(table)
        doc.Close()

        ' Descargar PDF
        Response.Clear()
        Response.ContentType = "application/pdf"
        Response.AddHeader("Content-Disposition", "attachment; filename=ReporteProgramas.pdf")
        Response.OutputStream.Write(ms.ToArray(), 0, ms.ToArray().Length)
        Response.Flush()
        Response.End()
    End Sub
End Class