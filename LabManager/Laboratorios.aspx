<%@ Page Title="Laboratorios" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Laboratorios.aspx.vb" Inherits="LabManager.Laboratorios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- menu con bootn regresar y encabezado del formulario -->
    <div class="container-fluid mt-3">
        <div class="row align-items-center  border p-3">
            <div class="col-4 text-start">
                <asp:Button ID="btnRegresar" runat="server" CssClass="btn btn-secondary" Text="Regresar" PostBackUrl="~/Administracion.aspx" />
            </div>
            <div class="col-4 text-center">
                <h4 class="m-0">Laboratorios</h4>
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
            <i class="fas fa-plus"></i>&nbsp;Agregar Nuevo Laboratorio
        </button>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar un nuevo laboratorio</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4 rounded d-flex flex-column align-items-center">
                    <asp:Panel ID="PanelModal" runat="server">
                        <div class="mb-3">
                            <label for="txtNombre" class="form-label">Nombre</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" MaxLength="100" />
                        </div>

                        <div class="mb-3">
                            <label for="txtUbicacion" class="form-label">Ubicación</label>
                            <asp:TextBox ID="txtUbicacion" runat="server" CssClass="form-control" MaxLength="255" />
                        </div>

                        <div class="mb-3">
                            <label for="txtCapacidad" class="form-label">Capacidad Máxima</label>
                            <asp:TextBox ID="txtCapacidad" runat="server" CssClass="form-control" TextMode="Number" />
                        </div>

                        <div class="mb-3">
                            <label for="ddlEstado" class="form-label">Estado</label>
                            <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-select" AppendDataBoundItems="True">
                            </asp:DropDownList>
                        </div>
                    </asp:Panel>
                </div>
                <div class="modal-footer w-100 d-flex justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" CssClass="btn btn-outline-success" />
                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="DS_Laboratorios" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
        SelectCommand="
        SELECT Laboratorios.id_laboratorio, Laboratorios.nombre, Laboratorios.ubicacion,
               Laboratorios.capacidad_maxima, Estados.nombre_estado
        FROM Laboratorios
        INNER JOIN Estados ON Laboratorios.id_estado = Estados.id_estado
        WHERE (@id_estado IS NULL OR Laboratorios.id_estado = @id_estado)"
        InsertCommand="INSERT INTO Laboratorios(nombre, ubicacion, capacidad_maxima, id_estado) VALUES (@nombre, @ubicacion, @capacidad, @estado)" CancelSelectOnNullParameter="false">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtNombre" Name="nombre" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtUbicacion" Name="ubicacion" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtCapacidad" Name="capacidad" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlEstado" DefaultValue="6" Name="estado" PropertyName="SelectedValue" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GV_Laboratorios" Name="id_laboratorio" PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFiltroEstado" Name="id_estado" PropertyName="SelectedValue"
                ConvertEmptyStringToNull="true" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_ActualizarLab" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT id_laboratorio, nombre, ubicacion, capacidad_maxima, id_estado FROM Laboratorios" UpdateCommand="UPDATE Laboratorios SET nombre = @nombre, ubicacion = @ubicacion, capacidad_maxima = @capacidad, id_estado = @estado WHERE (id_laboratorio = @lab)">
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtNombreUp" Name="nombre" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtUbicacionUp" Name="ubicacion" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtCapacidadUp" Name="capacidad" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlEstadoUp" Name="estado" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtIdUp" Name="lab" PropertyName="Text" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />
    <!-- filtro -->
    <div class="text-center my-3">
        <label for="ddlFiltroEstado" class="form-label">Filtrar por estado</label>
        <asp:DropDownList ID="ddlFiltroEstado" runat="server" AutoPostBack="True" CssClass="form-select d-inline w-auto"
            OnSelectedIndexChanged="ddlFiltroEstado_SelectedIndexChanged" DataSourceID="DS_estadosfiltro" DataTextField="nombre_estado" DataValueField="id_estado">
        </asp:DropDownList>
        <asp:SqlDataSource ID="DS_estadosfiltro" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT * FROM [Estados]"></asp:SqlDataSource>
    </div>

    <asp:GridView ID="GV_Laboratorios" runat="server" AllowPaging="True" DataSourceID="DS_Laboratorios" CssClass="table table-bordered table-hover table-responsive text-center table-striped" AutoGenerateColumns="False" DataKeyNames="id_laboratorio">
        <Columns>
            <asp:BoundField DataField="id_laboratorio" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_laboratorio" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
            <asp:BoundField DataField="ubicacion" HeaderText="Ubicacion" SortExpression="ubicacion" />
            <asp:BoundField DataField="capacidad_maxima" HeaderText="Capacidad" SortExpression="capacidad_maxima" />
            <asp:BoundField DataField="nombre_estado" HeaderText="Estado" SortExpression="nombre_estado" />

            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="BtnEditar" runat="server" Text="Editar" CommandName="Editar" OnClientClick="return confirm('¿Estás seguro de que deseas editar este laboratorio?')" CssClass="btn btn-outline-warning btn-sm" CommandArgument='<%# Eval("id_laboratorio") %>' />
                    &nbsp;&nbsp;
                    <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" OnClientClick="return confirm('¿Estás seguro de que deseas eliminar este laboratorio?')" CssClass="btn btn-outline-danger btn-sm" CommandArgument='<%# Eval("id_laboratorio") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Panel ID="Panel1" runat="server" Visible="false" CssClass="modal-content p-4 rounded shadow d-flex flex-column align-items-center">
        <div class="modal-header w-100 justify-content-center">
            <h5 class="modal-title text-center">Actualizar Laboratorio</h5>
        </div>
        <div class="modal-body w-100 d-flex flex-column align-items-center">
            <div class="mb-3 w-100 text-center">
                <label for="txtIdUp" class="form-label">ID</label>
                <asp:TextBox ID="txtIdUp" runat="server" CssClass="form-control mx-auto" MaxLength="100" Enabled="false" Style="max-width: 400px;" />
            </div>
            <div class="mb-3 w-100 text-center">
                <label for="txtNombreUp" class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombreUp" runat="server" CssClass="form-control mx-auto" MaxLength="100" Style="max-width: 400px;" />
            </div>
            <div class="mb-3 w-100 text-center">
                <label for="txtUbicacionUp" class="form-label">Ubicación</label>
                <asp:TextBox ID="txtUbicacionUp" runat="server" CssClass="form-control mx-auto" MaxLength="255" Style="max-width: 400px;" />
            </div>
            <div class="mb-3 w-100 text-center">
                <label for="txtCapacidadUp" class="form-label">Capacidad Máxima</label>
                <asp:TextBox ID="txtCapacidadUp" runat="server" CssClass="form-control mx-auto" TextMode="Number" Style="max-width: 400px;" />
            </div>
            <div class="mb-3 w-100 text-center">
                <label for="ddlEstadoUp" class="form-label">Estado</label>
                <asp:DropDownList ID="ddlEstadoUp" runat="server" CssClass="form-select mx-auto" AppendDataBoundItems="True" DataSourceID="DS_EstadosUp" DataTextField="nombre_estado" DataValueField="id_estado" Style="max-width: 400px;">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DS_EstadosUp" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT * FROM [Estados]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="modal-footer w-100 d-flex justify-content-center">
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-outline-secondary mx-2" />
            <asp:Button ID="BtnActualizar" runat="server" Text="Guardar" CssClass="btn btn-outline-success mx-2" />
        </div>
    </asp:Panel>



</asp:Content>
