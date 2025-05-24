<%@ Page Title="Reportes" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Reportes.aspx.vb" Inherits="LabManager.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- menu con bootn regresar y encabezado del formulario -->
    <div class="container-fluid mt-3">
        <div class="row align-items-center  border p-3">
            <div class="col-4 text-start">
                <asp:Button ID="btnRegresar" runat="server" CssClass="btn btn-secondary" Text="Regresar" PostBackUrl="~/Administracion.aspx" />
            </div>
            <div class="col-4 text-center">
                <h4 class="m-0">Reportes</h4>
            </div>
            <div class="col-4">
                <%-- Espacio derecho vacío, por si deseas agregar algo en el futuro --%>
            </div>
        </div>
    </div>
    <br />

    <div class="container mt-5 text-center">
        <div class="card shadow-lg rounded-4 border-0 mx-auto" style="max-width: 500px;">
            <div class="card-header bg-primary text-white d-flex align-items-center justify-content-center">
                <i class="fas fa-file-pdf fa-lg me-2"></i>
                <h4 class="mb-0">Generar Reportes en PDF</h4>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="ddlTipoReporte" class="form-label fw-semibold">
                        <i class="fas fa-list-alt me-1"></i>Selecciona un tipo de reporte:
                    </label>
                    <div class="d-flex justify-content-center">
                        <asp:DropDownList ID="ddlTipoReporte" runat="server" CssClass="form-select text-center" Style="max-width: 300px;">
                            <asp:ListItem Value="">Seleccionar el tipo de reporte</asp:ListItem>
                            <asp:ListItem Value="computadoras">📁 Reporte de Computadoras</asp:ListItem>
                            <asp:ListItem Value="mantenimientos">🛠️ Reporte de Mantenimientos</asp:ListItem>
                            <asp:ListItem Value="programas">💻 Reporte de Programas</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <button id="btnGenerarPDF" runat="server" class="btn btn-danger px-4 py-2 fw-bold"
                    onserverclick="btnGenerarPDF_ServerClick"
                    onclientclick="this.innerHTML='<i class=\'fas fa-spinner fa-spin me-2\'></i> Generando...'; this.disabled=true;">
                    <i class="fas fa-file-pdf me-2"></i>Generar PDF
                </button>
            </div>
        </div>
    </div>



</asp:Content>
