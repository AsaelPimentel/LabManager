<%@ Page Title="Computadoras" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Computadoras.aspx.vb" Inherits="LabManager.Computadoras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- menu con bootn regresar y encabezado del formulario -->
    <div class="container-fluid mt-3">
        <div class="row align-items-center  border p-3">
            <div class="col-4 text-start">
                <asp:Button ID="btnRegresar" runat="server" CssClass="btn btn-secondary" Text="Regresar" PostBackUrl="~/Administracion.aspx" />
            </div>
            <div class="col-4 text-center">
                <h4 class="m-0">Computadoras</h4>
            </div>
            <div class="col-4">
                <%-- Espacio derecho vacío, por si deseas agregar algo en el futuro --%>
            </div>
        </div>
    </div>
    <br />

    <!-- Button trigger modal -->
    <div class="text-center mb-4">
        <button type="button" class="btn btn-outline-success btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal">
            <i class="fas fa-desktop"></i>&nbsp;Agregar Nuevo equipo
        </button>
    </div>
    <!-- Modal -->
    <div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Nuevo Equipo</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4 rounded d-flex flex-column align-items-center">
                    <asp:Panel ID="PanelComputadora" runat="server">
                        <div class="mb-3">
                            <label for="ddlLaboratorio" class="form-label">Laboratorio</label>
                            <asp:DropDownList ID="ddlLaboratorio" runat="server" CssClass="form-select" AppendDataBoundItems="True" DataSourceID="DS_Laboratorios" DataTextField="nombre" DataValueField="id_laboratorio">
                                <asp:ListItem Text="Seleccione un laboratorio" Value="" />
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DS_Laboratorios" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT [id_laboratorio], [nombre] FROM [Laboratorios]"></asp:SqlDataSource>
                        </div>
                        <div class="mb-3">
                            <label for="txtNombreEquipo" class="form-label">Nombre del Equipo</label>
                            <asp:TextBox ID="txtNombreEquipo" runat="server" CssClass="form-control" MaxLength="100" />
                        </div>
                        <div class="mb-3">
                            <label for="txtFechaIngreso" class="form-label">Fecha de Ingreso</label>
                            <asp:TextBox ID="txtFechaIngreso" runat="server" CssClass="form-control" TextMode="Date" />
                        </div>
                        <div class="mb-3">
                            <label for="ddlEstadoEquipo" class="form-label">Estado</label>
                            <asp:DropDownList ID="ddlEstadoEquipo" runat="server" CssClass="form-select" AppendDataBoundItems="True" DataSourceID="DS_Estados" DataTextField="nombre_estado" DataValueField="id_estado">
                                <asp:ListItem Text="Seleccione estado" Value="" />
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DS_Estados" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT * FROM [Estados]"></asp:SqlDataSource>
                        </div>
                    </asp:Panel>
                </div>
                <div class="modal-footer w-100 d-flex justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="BtnGuardarEquipo" runat="server" Text="Guardar" CssClass="btn btn-outline-success" />
                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="DS_Computadoras" runat="server"
        ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
        SelectCommand="SELECT Computadoras.id_computadora, Laboratorios.nombre, Computadoras.nombre_equipo, Computadoras.fecha_ingreso, Estados.nombre_estado
                   FROM Computadoras
                   INNER JOIN Laboratorios ON Computadoras.id_laboratorio = Laboratorios.id_laboratorio
                   INNER JOIN Estados ON Computadoras.id_estado = Estados.id_estado
                   WHERE (@id_estado IS NULL OR Computadoras.id_estado = @id_estado)
                   AND (@id_laboratorio IS NULL OR Computadoras.id_laboratorio = @id_laboratorio)"
        InsertCommand="INSERT INTO Computadoras(id_laboratorio, nombre_equipo, fecha_ingreso, id_estado) VALUES (@laboratorio, @nombre, @fecha, @estado)" CancelSelectOnNullParameter="false">

        <SelectParameters>
            <asp:Parameter Name="id_estado" Type="Int32" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="id_laboratorio" Type="Int32" ConvertEmptyStringToNull="true" />
        </SelectParameters>

        <InsertParameters>
            <asp:ControlParameter ControlID="ddlLaboratorio" Name="laboratorio" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtNombreEquipo" Name="nombre" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtFechaIngreso" Name="fecha" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlEstadoEquipo" Name="estado" PropertyName="SelectedValue" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_ActualizarPC" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT * FROM [Computadoras]" UpdateCommand="UPDATE Computadoras SET id_laboratorio = @laboratorio, nombre_equipo = @equipo, fecha_ingreso = @fecha, id_estado = @estado WHERE (id_computadora = @id)">
        <UpdateParameters>
            <asp:ControlParameter ControlID="ddlLaboratorioUp" Name="laboratorio" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtNombreEquipoUp" Name="equipo" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtFechaIngresoUp" Name="fecha" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlEstadoComputadoraUp" Name="estado" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtIdComputadoraUp" Name="id" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!-- Filtros -->
    <div class="container mb-4">
        <div class="row justify-content-center g-2">

            <!-- Filtro por Estado -->
            <div class="col-md-4">
                <asp:DropDownList ID="ddlFiltroEstado" runat="server" CssClass="form-select"
                    DataSourceID="DS_Estados" DataTextField="nombre_estado" DataValueField="id_estado" AppendDataBoundItems="True">
                    <asp:ListItem Text="Todos los Estados" Value="" />
                </asp:DropDownList>
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnFiltrarEstado" runat="server" Text="Filtrar Estado" CssClass="btn btn-outline-primary w-100" />
            </div>

            <!-- Filtro por Laboratorio -->
            <div class="col-md-4">
                <asp:DropDownList ID="ddlFiltroLaboratorio" runat="server" CssClass="form-select"
                    DataSourceID="DS_Laboratorios" DataTextField="nombre" DataValueField="id_laboratorio" AppendDataBoundItems="True">
                    <asp:ListItem Text="Todos los Laboratorios" Value="" />
                </asp:DropDownList>
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnFiltrarLaboratorio" runat="server" Text="Filtrar Laboratorio" CssClass="btn btn-outline-primary w-100" />
            </div>

        </div>
    </div>

    <asp:GridView ID="GV_Computadoras" runat="server" AllowPaging="True" DataSourceID="DS_Computadoras" CssClass="table table-bordered table-hover table-responsive text-center table-striped" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="id_computadora" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_computadora" />
            <asp:BoundField DataField="nombre" HeaderText="Laboratorio" SortExpression="nombre" />
            <asp:BoundField DataField="nombre_equipo" HeaderText="No. de Serie" SortExpression="nombre_equipo" />
            <asp:BoundField DataField="fecha_ingreso" HeaderText="Fecha de registro" SortExpression="fecha_ingreso" />
            <asp:BoundField DataField="nombre_estado" HeaderText="Estado" SortExpression="nombre_estado" />
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="BtnEditar" runat="server" Text="Editar" CommandName="Editar" OnClientClick="return confirm('¿Estás seguro de que deseas editar esta computadora?')" CssClass="btn btn-outline-warning btn-sm" CommandArgument='<%# Eval("id_computadora") %>' />
                    &nbsp;&nbsp;
                    <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" OnClientClick="return confirm('¿Estás seguro de que deseas eliminar esta computadora?')" CssClass="btn btn-outline-danger btn-sm" CommandArgument='<%# Eval("id_computadora") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Panel ID="PanelActualizarComputadora" runat="server" Visible="false" CssClass="modal-content p-4 rounded shadow d-flex flex-column align-items-center">
        <div class="modal-header w-100 justify-content-center">
            <h5 class="modal-title text-center">Actualizar Equipo</h5>
        </div>
        <div class="modal-body w-100 d-flex flex-column align-items-center">

            <!-- ID Computadora (solo lectura) -->
            <div class="mb-3 w-100 text-center">
                <label for="txtIdComputadoraUp" class="form-label">ID Computadora</label>
                <asp:TextBox ID="txtIdComputadoraUp" runat="server" CssClass="form-control mx-auto" Enabled="false" Style="max-width: 400px;" />
            </div>

            <!-- Laboratorio -->
            <div class="mb-3 w-100 text-center">
                <label for="ddlLaboratorioUp" class="form-label">Laboratorio</label>
                <asp:DropDownList ID="ddlLaboratorioUp" runat="server" CssClass="form-select mx-auto"
                    AppendDataBoundItems="True" DataSourceID="DS_Laboratorios"
                    DataTextField="nombre" DataValueField="id_laboratorio" Style="max-width: 400px;">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DS_LabComp" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT * FROM [Estados]"></asp:SqlDataSource>
            </div>

            <!-- Nombre del Equipo -->
            <div class="mb-3 w-100 text-center">
                <label for="txtNombreEquipoUp" class="form-label">Nombre del Equipo</label>
                <asp:TextBox ID="txtNombreEquipoUp" runat="server" CssClass="form-control mx-auto" MaxLength="100" Style="max-width: 400px;" />
            </div>

            <!-- Fecha de Ingreso -->
            <div class="mb-3 w-100 text-center">
                <label for="txtFechaIngresoUp" class="form-label">Fecha de Ingreso</label>
                <asp:TextBox ID="txtFechaIngresoUp" runat="server" CssClass="form-control mx-auto" TextMode="Date" Style="max-width: 400px;" />
            </div>

            <!-- Estado -->
            <div class="mb-3 w-100 text-center">
                <label for="ddlEstadoComputadoraUp" class="form-label">Estado</label>
                <asp:DropDownList ID="ddlEstadoComputadoraUp" runat="server" CssClass="form-select mx-auto" AppendDataBoundItems="True" DataSourceID="DS_EstadosComp" DataTextField="nombre_estado" DataValueField="id_estado" Style="max-width: 400px;">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DS_EstadosComp" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT [id_estado], [nombre_estado] FROM [Estados]"></asp:SqlDataSource>
            </div>

        </div>
        <div class="modal-footer w-100 d-flex justify-content-center">
            <asp:Button ID="btnCancelarUp" runat="server" Text="Cancelar" CssClass="btn btn-outline-secondary mx-2" />
            <asp:Button ID="btnActualizarComputadora" runat="server" Text="Guardar" CssClass="btn btn-outline-success mx-2" />
        </div>
    </asp:Panel>


</asp:Content>
