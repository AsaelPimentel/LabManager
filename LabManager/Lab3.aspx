<%@ Page Title="Lab3" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Lab3.aspx.vb" Inherits="LabManager.Lab3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-center mt-4">
        <h1 class="display-4 fw-bold text-primary">Laboratorio 3</h1>
        <p class="lead text-secondary">Gestiona y administra los elementos del laboratorio de manera eficiente.</p>
    </div>

    <div class="container my-4">
        <div class="row justify-content-center text-center">
            <div class="col-md-auto mb-3">
                <asp:Label ID="Label1" runat="server" Text="Mostrar:" CssClass="form-label fw-bold me-2 d-block"></asp:Label>
                <asp:DropDownList ID="DdlGridview" runat="server" CssClass="form-select form-select-lg shadow-sm border-primary text-center mx-auto" AutoPostBack="True" OnSelectedIndexChanged="DdlGridview_SelectedIndexChanged">
                    <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                    <asp:ListItem Value="1">Programas</asp:ListItem>
                    <asp:ListItem Value="2">Componentes</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-auto mb-3">
                <asp:Label ID="LabelComputadora" runat="server" Text="Selecciona Computadora:" CssClass="form-label fw-bold me-2 d-block"></asp:Label>
                <asp:DropDownList ID="DdlComputadora" runat="server" CssClass="form-select form-select-lg shadow-sm border-primary text-center mx-auto" AutoPostBack="True" OnSelectedIndexChanged="DdlComputadora_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>
    </div>

    <!-- SqlDataSource para Programas -->
    <asp:SqlDataSource ID="DS_Lab3" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
        SelectCommand="SELECT [id_asignacion], [nombre_laboratorio], [ubicacion], [nombre_equipo], [fecha_instalacion], [nombre_programa], [version_programa], [licencia], [descripcion]
                       FROM [Vista_ProgramasPorComputadoraYLaboratorio]
                       WHERE ([id_laboratorio] = @id_laboratorio) AND ([id_computadora] = @id_computadora)">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="id_laboratorio" Type="Int32" />
            <asp:ControlParameter ControlID="DdlComputadora" Name="id_computadora" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GV_Lab3" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id_asignacion" DataSourceID="DS_Lab3" CssClass="table table-bordered table-hover table-responsive text-center table-striped" Visible="false">
        <Columns>
            <asp:BoundField DataField="id_asignacion" HeaderText="#" ReadOnly="True" />
            <asp:BoundField DataField="nombre_laboratorio" HeaderText="Laboratorio" />
            <asp:BoundField DataField="ubicacion" HeaderText="Ubicación" />
            <asp:BoundField DataField="nombre_equipo" HeaderText="Equipo" />
            <asp:BoundField DataField="fecha_instalacion" HeaderText="Fecha de Instalación" />
            <asp:BoundField DataField="nombre_programa" HeaderText="Programa" />
            <asp:BoundField DataField="version_programa" HeaderText="Versión" />
            <asp:BoundField DataField="licencia" HeaderText="Licencia" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
        </Columns>
    </asp:GridView>

    <!-- SqlDataSource para Componentes -->
    <asp:SqlDataSource ID="DS_Lab3PC" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
        SelectCommand="SELECT * FROM [vw_ComponentesPorComputadora] WHERE ([id_laboratorio] = @id_laboratorio) AND ([id_computadora] = @id_computadora)">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="id_laboratorio" Type="Int32" />
            <asp:ControlParameter ControlID="DdlComputadora" Name="id_computadora" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GV_PCsLab3" runat="server" AutoGenerateColumns="False" DataKeyNames="id_computadora,id_componente" DataSourceID="DS_Lab3PC" CssClass="table table-bordered table-hover table-responsive text-center table-striped" AllowPaging="True" Visible="false">
        <Columns>
            <asp:BoundField DataField="id_computadora" HeaderText="#" ReadOnly="True" />
            <asp:BoundField DataField="nombre_equipo" HeaderText="Equipo" />
            <asp:BoundField DataField="id_laboratorio" HeaderText="Laboratorio" />
            <asp:BoundField DataField="id_componente" HeaderText="Componente" ReadOnly="True" />
            <asp:BoundField DataField="tipo_componente" HeaderText="Tipo de componente" />
            <asp:BoundField DataField="marca" HeaderText="Marca" />
            <asp:BoundField DataField="modelo" HeaderText="Modelo" />
            <asp:BoundField DataField="numero_serie" HeaderText="Serie" />
            <asp:BoundField DataField="capacidad" HeaderText="Capacidad" />
            <asp:BoundField DataField="tipo_almacenamiento" HeaderText="Almacenamiento" />
        </Columns>
    </asp:GridView>
</asp:Content>
