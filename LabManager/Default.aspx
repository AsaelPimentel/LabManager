<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="LabManager._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center my-4">
        <h3 class="fw-semibold text-primary bg-light px-4 py-3 rounded shadow-sm d-inline-block mx-auto">Bienvenido, <%= Session("nombre") %>
        </h3>
    </div>






    <div class="container mt-5">
        <div class="row text-center">

            <!-- Laboratorios -->
            <div class="col-md-3 mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <i class="fas fa-flask fa-3x text-primary mb-3"></i>
                        <h5 class="card-title">Laboratorios</h5>
                        <asp:Label ID="lblLaboratorios" runat="server" CssClass="h4 font-weight-bold" Text="0"></asp:Label>
                    </div>
                </div>
            </div>

            <!-- Computadoras -->
            <div class="col-md-3 mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <i class="fas fa-desktop fa-3x text-success mb-3"></i>
                        <h5 class="card-title">Computadoras</h5>
                        <asp:Label ID="lblComputadoras" runat="server" CssClass="h4 font-weight-bold" Text="0"></asp:Label>
                    </div>
                </div>
            </div>

            <!-- Componentes -->
            <div class="col-md-3 mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <i class="fas fa-microchip fa-3x text-warning mb-3"></i>
                        <h5 class="card-title">Componentes</h5>
                        <asp:Label ID="lblComponentes" runat="server" CssClass="h4 font-weight-bold" Text="0"></asp:Label>
                    </div>
                </div>
            </div>

            <!-- Programas -->
            <div class="col-md-3 mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <i class="fas fa-cogs fa-3x text-danger mb-3"></i>
                        <h5 class="card-title">Programas</h5>
                        <asp:Label ID="lblProgramas" runat="server" CssClass="h4 font-weight-bold" Text="0"></asp:Label>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="col-md-3 mb-4">
        <div class="card shadow-sm">
            <div class="card-body text-center">
                <i class="fas fa-wrench fa-3x text-secondary mb-3"></i>
                <h5 class="card-title">Mantenimientos</h5>
                <asp:Button ID="btnVerMantenimientos" runat="server" Text="Ver"
                    CssClass="btn btn-outline-secondary btn-sm"
                    PostBackUrl="~/Mantenimientos.aspx"
                    Visible="false" />
            </div>
        </div>
    </div>

    <div class="col-md-3 mb-4">
        <div class="card shadow-sm">
            <div class="card-body text-center">
                <i class="fas fa-file-pdf fa-3x text-secondary mb-3"></i>
                <h5 class="card-title">Reportes</h5>
                <asp:Button ID="btnVerReportes" runat="server" Text="Ver"
                    CssClass="btn btn-outline-secondary btn-sm"
                    PostBackUrl="~/Reportes.aspx"
                    Visible="true" />
            </div>
        </div>
    </div>


</asp:Content>
