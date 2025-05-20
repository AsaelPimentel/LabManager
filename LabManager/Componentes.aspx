<%@ Page Title="Componentes" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Componentes.aspx.vb" Inherits="LabManager.Componentes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- menu con bootn regresar y encabezado del formulario -->
    <div class="container-fluid mt-3">
        <div class="row align-items-center  border p-3">
            <div class="col-4 text-start">
                <asp:Button ID="btnRegresar" runat="server" CssClass="btn btn-secondary" Text="Regresar" PostBackUrl="~/Administracion.aspx" />
            </div>
            <div class="col-4 text-center">
                <h4 class="m-0">Componentes</h4>
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
            <i class="fas fa-microchip"></i>&nbsp;Agregar Nuevo componente
        </button>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar un nuevo componente</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4 rounded">
                    <asp:Panel ID="PanelModal" runat="server">
                        <div class="container-fluid">
                            <div class="row g-3">

                                <!-- Computadora -->
                                <div class="col-md-6">
                                    <label for="ddlComputadora" class="form-label">Computadora</label>
                                    <asp:DropDownList ID="ddlComputadora" runat="server" CssClass="form-select" AppendDataBoundItems="True" DataSourceID="DS_PcInsert" DataTextField="nombre_equipo" DataValueField="id_computadora">
                                        <asp:ListItem Text="Seleccione una computadora" Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="DS_PcInsert" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT [nombre_equipo], [id_computadora] FROM [Computadoras]"></asp:SqlDataSource>
                                </div>

                                <!-- Tipo -->
                                <div class="col-md-6">
                                    <label for="txtTipo" class="form-label">Tipo</label>
                                    <asp:TextBox ID="txtTipo" runat="server" CssClass="form-control" MaxLength="50" />
                                </div>

                                <!-- Marca -->
                                <div class="col-md-6">
                                    <label for="txtMarca" class="form-label">Marca</label>
                                    <asp:TextBox ID="txtMarca" runat="server" CssClass="form-control" MaxLength="100" />
                                </div>

                                <!-- Modelo -->
                                <div class="col-md-6">
                                    <label for="txtModelo" class="form-label">Modelo</label>
                                    <asp:TextBox ID="txtModelo" runat="server" CssClass="form-control" MaxLength="100" />
                                </div>

                                <!-- Número de Serie -->
                                <div class="col-md-6">
                                    <label for="txtSerie" class="form-label">Número de Serie</label>
                                    <asp:TextBox ID="txtSerie" runat="server" CssClass="form-control" MaxLength="100" />
                                </div>

                                <!-- Capacidad -->
                                <div class="col-md-6">
                                    <label for="txtCapacidad" class="form-label">Capacidad</label>
                                    <asp:TextBox ID="txtCapacidad" runat="server" CssClass="form-control" MaxLength="50" />
                                </div>

                                <!-- Tipo de Almacenamiento -->
                                <div class="col-md-12">
                                    <label for="txtTipoAlmacenamiento" class="form-label">Tipo de Almacenamiento</label>
                                    <asp:TextBox ID="txtTipoAlmacenamiento" runat="server" CssClass="form-control" MaxLength="50" />
                                </div>
                                <!-- Campo nuevo: Estado -->
                                <div class="col-md-12">
                                    <label for="ddlEstado" class="form-label">Estado</label>
                                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-select" AppendDataBoundItems="True"
                                        DataSourceID="DS_Estados" DataTextField="nombre_estado" DataValueField="id_estado">
                                        <asp:ListItem Text="Seleccione un estado" Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="DS_Estados" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
                                        SelectCommand="SELECT id_estado, nombre_estado FROM Estados"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div class="modal-footer w-100 d-flex justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" CssClass="btn btn-outline-success" />
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="DS_Componente" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" InsertCommand="INSERT INTO Componentes(id_computadora, tipo, marca, modelo, numero_serie, capacidad, tipo_almacenamiento, id_estado) VALUES (@pc, @tipo, @marca, @modelo, @serie, @capacidad, @tipoAl, @estado)" SelectCommand="SELECT Componentes.id_componente, Computadoras.nombre_equipo, Componentes.tipo, Componentes.marca, Componentes.modelo, Componentes.numero_serie, Componentes.capacidad, Componentes.tipo_almacenamiento, Estados.nombre_estado FROM Componentes INNER JOIN Computadoras ON Componentes.id_computadora = Computadoras.id_computadora INNER JOIN Estados ON Componentes.id_estado = Estados.id_estado" UpdateCommand="UPDATE Componentes SET WHERE (id_componente = @componente)">
        <InsertParameters>
            <asp:ControlParameter ControlID="ddlComputadora" Name="pc" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtTipo" Name="tipo" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMarca" Name="marca" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtModelo" Name="modelo" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtSerie" Name="serie" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtCapacidad" Name="capacidad" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtTipoAlmacenamiento" Name="tipoAl" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlEstado" Name="estado" PropertyName="SelectedValue" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GV_Componentes" Name="componente" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GV_Componentes" runat="server" AllowPaging="True" DataSourceID="DS_Componente"
        CssClass="table table-bordered table-hover table-responsive text-center table-striped"
        AutoGenerateColumns="False" DataKeyNames="id_componente">
        <Columns>
            <asp:BoundField DataField="id_componente" HeaderText="#" ReadOnly="True" InsertVisible="False" SortExpression="id_componente" />
            <asp:BoundField DataField="nombre_equipo" HeaderText="Equipo" SortExpression="nombre_equipo" />
            <asp:BoundField DataField="tipo" HeaderText="Tipo" SortExpression="tipo" />
            <asp:BoundField DataField="marca" HeaderText="Marca" SortExpression="marca" />
            <asp:BoundField DataField="modelo" HeaderText="Modelo" SortExpression="modelo" />
            <asp:BoundField DataField="numero_serie" HeaderText="Serie" SortExpression="numero_serie" />
            <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
            <asp:BoundField DataField="tipo_almacenamiento" HeaderText="Almacenamiento" SortExpression="tipo_almacenamiento" />

            <asp:BoundField DataField="nombre_estado" HeaderText="Estado" SortExpression="nombre_estado" />
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="BtnEditar" runat="server" Text="Editar" CommandName="Editar" OnClientClick="return confirm('¿Estás seguro de que deseas editar este componente?')" CssClass="btn btn-outline-warning btn-sm" CommandArgument='<%# Eval("id_componente") %>' />
                    &nbsp;&nbsp;
                    <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" OnClientClick="return confirm('¿Estás seguro de que deseas eliminar este componente?')" CssClass="btn btn-outline-danger btn-sm" CommandArgument='<%# Eval("id_componente") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


    <asp:Panel ID="PanelActualizarComponente" runat="server" Visible="false" CssClass="modal-content p-4 rounded shadow d-flex flex-column align-items-center">
        <div class="modal-header w-100 justify-content-center">
            <h5 class="modal-title text-center">Actualizar Componente</h5>
        </div>
        <div class="modal-body w-100 d-flex flex-column align-items-center">

            <!-- ID Componente (solo lectura) -->
            <div class="mb-3 w-100 text-center">
                <label for="txtIdComponenteUp" class="form-label">ID Componente</label>
                <asp:TextBox ID="txtIdComponenteUp" runat="server" CssClass="form-control mx-auto" Enabled="false" Style="max-width: 400px;" />
            </div>

            <!-- Computadora -->
            <div class="mb-3 w-100 text-center">
                <label for="ddlComputadoraUp" class="form-label">Computadora</label>
                <asp:DropDownList ID="ddlComputadoraUp" runat="server" CssClass="form-select mx-auto"
                    DataSourceID="DS_PcInsert" DataTextField="nombre_equipo" DataValueField="id_computadora"
                    Style="max-width: 400px;">
                </asp:DropDownList>
            </div>

            <!-- Tipo -->
            <div class="mb-3 w-100 text-center">
                <label for="txtTipoUp" class="form-label">Tipo</label>
                <asp:TextBox ID="txtTipoUp" runat="server" CssClass="form-control mx-auto" MaxLength="50" Style="max-width: 400px;" />
            </div>

            <!-- Marca -->
            <div class="mb-3 w-100 text-center">
                <label for="txtMarcaUp" class="form-label">Marca</label>
                <asp:TextBox ID="txtMarcaUp" runat="server" CssClass="form-control mx-auto" MaxLength="100" Style="max-width: 400px;" />
            </div>

            <!-- Modelo -->
            <div class="mb-3 w-100 text-center">
                <label for="txtModeloUp" class="form-label">Modelo</label>
                <asp:TextBox ID="txtModeloUp" runat="server" CssClass="form-control mx-auto" MaxLength="100" Style="max-width: 400px;" />
            </div>

            <!-- Número de Serie -->
            <div class="mb-3 w-100 text-center">
                <label for="txtSerieUp" class="form-label">Número de Serie</label>
                <asp:TextBox ID="txtSerieUp" runat="server" CssClass="form-control mx-auto" MaxLength="100" Style="max-width: 400px;" />
            </div>

            <!-- Capacidad -->
            <div class="mb-3 w-100 text-center">
                <label for="txtCapacidadUp" class="form-label">Capacidad</label>
                <asp:TextBox ID="txtCapacidadUp" runat="server" CssClass="form-control mx-auto" MaxLength="50" Style="max-width: 400px;" />
            </div>

            <!-- Tipo de Almacenamiento -->
            <div class="mb-3 w-100 text-center">
                <label for="txtTipoAlmacenamientoUp" class="form-label">Tipo de Almacenamiento</label>
                <asp:TextBox ID="txtTipoAlmacenamientoUp" runat="server" CssClass="form-control mx-auto" MaxLength="50" Style="max-width: 400px;" />
            </div>

            <!-- Estado -->
            <div class="mb-3 w-100 text-center">
                <label for="ddlEstadoUp" class="form-label">Estado</label>
                <asp:DropDownList ID="ddlEstadoUp" runat="server" CssClass="form-select mx-auto"
                    DataSourceID="DS_Estados" DataTextField="nombre_estado" DataValueField="id_estado"
                    Style="max-width: 400px;">
                </asp:DropDownList>
            </div>

        </div>
        <div class="modal-footer w-100 d-flex justify-content-center">
            <asp:Button ID="btnCancelarEdicion" runat="server" Text="Cancelar" CssClass="btn btn-outline-secondary mx-2" />
            <asp:Button ID="btnGuardarEdicion" runat="server" Text="Guardar Cambios" CssClass="btn btn-outline-success mx-2" />

        </div>
    </asp:Panel>

    <asp:SqlDataSource ID="DS_ComponenteUp" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT * FROM [Componentes]" UpdateCommand="UPDATE Componentes SET id_computadora = @computadora, tipo = @tipo, marca = @marca, modelo = @modelo, numero_serie = @serie, capacidad = @capacidad, tipo_almacenamiento = @almacenamiento, id_estado = @estado WHERE (id_componente = @id)">
        <UpdateParameters>
            <asp:ControlParameter ControlID="ddlComputadoraUp" Name="computadora" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtTipoUp" Name="tipo" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMarcaUp" Name="marca" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtModeloUp" Name="modelo" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtSerieUp" Name="serie" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtCapacidadUp" Name="capacidad" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtTipoAlmacenamientoUp" Name="almacenamiento" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlEstadoUp" Name="estado" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtIdComponenteUp" Name="id" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
