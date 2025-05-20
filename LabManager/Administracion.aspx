<%@ Page Title="Administracion" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Administracion.aspx.vb" Inherits="LabManager.Adminsitracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <link rel="stylesheet" href="Css/MenuBotones.css" />

    <div class="container py-5">
        <div class="row g-4 text-center">

            <!-- Laboratorios -->
            <div class="col-6 col-md-4 col-lg-3 d-flex h-100">
                <asp:LinkButton ID="btnLaboratorios" runat="server" CssClass="icon-button w-100 h-100" PostBackUrl="~/Laboratorios.aspx">
    <i class="fas fa-flask"></i>
    <div class="icon-label">Laboratorios</div>
                </asp:LinkButton>
            </div>

            <!-- Computadoras -->
            <div class="col-6 col-md-4 col-lg-3 d-flex">
                <asp:LinkButton ID="btnComputadoras" runat="server" CssClass="icon-button w-100 h-100" PostBackUrl="~/Computadoras.aspx">
        <i class="fas fa-desktop"></i>
        <div class="icon-label">Computadoras</div>
                </asp:LinkButton>
            </div>

            <!-- Componentes -->
            <div class="col-6 col-md-4 col-lg-3 d-flex">
                <asp:LinkButton ID="btnComponentes" runat="server" CssClass="icon-button w-100 h-100" PostBackUrl="~/Componentes.aspx">
        <i class="fas fa-microchip"></i>
        <div class="icon-label">Componentes</div>
                </asp:LinkButton>
            </div>

            <!-- Programas -->
            <div class="col-6 col-md-4 col-lg-3 d-flex">
                <asp:LinkButton ID="btnProgramas" runat="server" CssClass="icon-button w-100 h-100" PostBackUrl="~/Programas.aspx">
        <i class="fas fa-code"></i>
        <div class="icon-label">Programas</div>
                </asp:LinkButton>
            </div>

            <!-- Mantenimientos -->
            <div class="col-6 col-md-4 col-lg-3 d-flex">
                <asp:LinkButton ID="btnMantenimientos" runat="server" CssClass="icon-button w-100 h-100" PostBackUrl="~/Mantenimientos.aspx">
        <i class="fas fa-tools"></i>
        <div class="icon-label">Mantenimientos</div>
                </asp:LinkButton>
            </div>

            <!-- Reportes -->
            <div class="col-6 col-md-4 col-lg-3 d-flex">
                <asp:LinkButton ID="btnReportes" runat="server" CssClass="icon-button w-100 h-100" PostBackUrl="~/Reportes.aspx">
        <i class="fas fa-file-alt"></i>
        <div class="icon-label">Reportes</div>
                </asp:LinkButton>
            </div>

            <!-- Usuarios -->
            <div class="col-6 col-md-4 col-lg-3 d-flex">
                <asp:LinkButton ID="btnUsuarios" runat="server" CssClass="icon-button w-100 h-100" PostBackUrl="~/Usuarios.aspx">
        <i class="fas fa-users"></i>
        <div class="icon-label">Usuarios</div>
                </asp:LinkButton>
            </div>
            <!-- Asignar Programas -->
            <div class="col-6 col-md-4 col-lg-3 d-flex">
                <asp:LinkButton ID="btnAsignarProgramas" runat="server" CssClass="icon-button w-100 h-100" PostBackUrl="~/AsignarProgramas.aspx">
        <i class="fas fa-plug"></i>
        <div class="icon-label">Asignar Programas</div>
                </asp:LinkButton>
            </div>

        </div>
    </div>


</asp:Content>
