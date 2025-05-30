﻿<%@ Page Title="Laboratorio 2" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Lab2.aspx.vb" Inherits="LabManager.Lab2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container text-center mt-4">
        <h1 class="display-4 fw-bold text-primary">Laboratorio 2</h1>
        <p class="lead text-secondary">Gestiona y administra los elementos del laboratorio de manera eficiente.</p>
    </div>

    <div class="container my-4">
        <div class="row justify-content-center text-center">

            <!-- Dropdown para seleccionar qué mostrar -->
            <div class="col-md-auto mb-3">
                <asp:Label ID="Label1" runat="server" Text="Mostrar:" CssClass="form-label fw-bold me-2 d-block"></asp:Label>
                <asp:DropDownList ID="DdlGridview" runat="server" CssClass="form-select form-select-lg shadow-sm border-primary text-center mx-auto" AutoPostBack="True" OnSelectedIndexChanged="DdlGridview_SelectedIndexChanged">
                    <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                    <asp:ListItem Value="1">Programas</asp:ListItem>
                    <asp:ListItem Value="2">Componentes</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Dropdown para seleccionar la computadora -->
            <div class="col-md-auto mb-3">
                <asp:Label ID="LabelComputadora" runat="server" Text="Selecciona Computadora:" CssClass="form-label fw-bold me-2 d-block"></asp:Label>
                <asp:DropDownList ID="DdlComputadora" runat="server" CssClass="form-select form-select-lg shadow-sm border-primary text-center mx-auto" AutoPostBack="True" OnSelectedIndexChanged="DdlComputadora_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

        </div>
    </div>

    <!-- SqlDataSource para Programas -->
    <asp:SqlDataSource ID="DS_Lab2" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
        SelectCommand="SELECT [id_asignacion], [nombre_laboratorio], [ubicacion], [nombre_equipo], [fecha_instalacion], [nombre_programa], [version_programa], [licencia], [descripcion]
                       FROM [Vista_ProgramasPorComputadoraYLaboratorio]
                       WHERE ([id_laboratorio] = @id_laboratorio) AND ([id_computadora] = @id_computadora)">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="id_laboratorio" Type="Int32" />
            <asp:ControlParameter ControlID="DdlComputadora" Name="id_computadora" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GV_Lab2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id_asignacion" DataSourceID="DS_Lab2" CssClass="table table-bordered table-hover table-responsive text-center table-striped" Visible="false">
        <Columns>
            <asp:BoundField DataField="id_asignacion" HeaderText="#" ReadOnly="True" SortExpression="id_asignacion" />
            <asp:BoundField DataField="nombre_laboratorio" HeaderText="Laboratorio" SortExpression="nombre_laboratorio" />
            <asp:BoundField DataField="ubicacion" HeaderText="Ubicación" SortExpression="ubicacion" />
            <asp:BoundField DataField="nombre_equipo" HeaderText="Equipo" SortExpression="nombre_equipo" />
            <asp:BoundField DataField="fecha_instalacion" HeaderText="Fecha de Instalación" SortExpression="fecha_instalacion" />
            <asp:BoundField DataField="nombre_programa" HeaderText="Programa" SortExpression="nombre_programa" />
            <asp:BoundField DataField="version_programa" HeaderText="Versión" SortExpression="version_programa" />
            <asp:BoundField DataField="licencia" HeaderText="Licencia" SortExpression="licencia" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="descripcion" />
        </Columns>
    </asp:GridView>

    <!-- SqlDataSource para Componentes -->
    <asp:SqlDataSource ID="DS_Lab2PC" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
        SelectCommand="SELECT * FROM [vw_ComponentesPorComputadora] WHERE ([id_laboratorio] = @id_laboratorio) AND ([id_computadora] = @id_computadora)">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="id_laboratorio" Type="Int32" />
            <asp:ControlParameter ControlID="DdlComputadora" Name="id_computadora" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GV_PCsLab2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_computadora,id_componente" DataSourceID="DS_Lab2PC" CssClass="table table-bordered table-hover table-responsive text-center table-striped" AllowPaging="True" Visible="false">
        <Columns>
            <asp:BoundField DataField="id_computadora" HeaderText="#" ReadOnly="True" SortExpression="id_computadora" />
            <asp:BoundField DataField="nombre_equipo" HeaderText="Equipo" SortExpression="nombre_equipo" />
            <asp:BoundField DataField="id_laboratorio" HeaderText="Laboratorio" SortExpression="id_laboratorio" />
            <asp:BoundField DataField="id_componente" HeaderText="Componente" ReadOnly="True" SortExpression="id_componente" />
            <asp:BoundField DataField="tipo_componente" HeaderText="Tipo de componente" SortExpression="tipo_componente" />
            <asp:BoundField DataField="marca" HeaderText="Marca" SortExpression="marca" />
            <asp:BoundField DataField="modelo" HeaderText="Modelo" SortExpression="modelo" />
            <asp:BoundField DataField="numero_serie" HeaderText="Serie" SortExpression="numero_serie" />
            <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
            <asp:BoundField DataField="tipo_almacenamiento" HeaderText="Almacenamiento" SortExpression="tipo_almacenamiento" />
        </Columns>
    </asp:GridView>

</asp:Content>
