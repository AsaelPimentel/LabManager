<%@ Page Title="Mantenimientos" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Mantenimientos.aspx.vb" Inherits="LabManager.Mantenimientos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Encabezado con botón regresar -->
    <div class="container-fluid mt-3">
        <div class="row align-items-center border p-3">
            <div class="col-4 text-start">
                <asp:Button ID="btnRegresar" runat="server" CssClass="btn btn-secondary" Text="Regresar" PostBackUrl="~/Administracion.aspx" />
            </div>
            <div class="col-4 text-center">
                <h4 class="m-0">Mantenimientos</h4>
            </div>
            <div class="col-4"></div>
        </div>
    </div>

    <br />

    <!-- Botón para abrir modal -->
    <div class="text-center mb-4">
        <button type="button" class="btn btn-outline-success btn-lg" data-bs-toggle="modal" data-bs-target="#modalMantenimiento">
            <i class="fas fa-tools"></i>&nbsp;Agregar Mantenimiento
        </button>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modalMantenimiento" tabindex="-1" aria-labelledby="modalMantenimientoLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="modalMantenimientoLabel">Registrar nuevo mantenimiento</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body p-4 rounded d-flex flex-column align-items-center">
                    <asp:Panel ID="PanelModalMantenimiento" runat="server">
                        <div class="mb-3">
                            <label for="ddlComputadora" class="form-label">Computadora</label>
                            <asp:DropDownList ID="ddlComputadora" runat="server" CssClass="form-select" AppendDataBoundItems="True"
                                DataSourceID="DS_Computadoras" DataTextField="nombre_equipo" DataValueField="id_computadora">
                                <asp:ListItem Text="Seleccione una computadora..." Value="" />
                            </asp:DropDownList>
                        </div>

                        <div class="mb-3">
                            <label for="txtTipo" class="form-label">Tipo</label>
                            <asp:TextBox ID="txtTipo" runat="server" CssClass="form-control" MaxLength="50" />
                        </div>

                        <div class="mb-3">
                            <label for="txtDescripcion" class="form-label">Descripción</label>
                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                        </div>

                        <div class="mb-3">
                            <label for="txtFechaProgramada" class="form-label">Fecha Programada</label>
                            <asp:TextBox ID="txtFechaProgramada" runat="server" CssClass="form-control" TextMode="Date" />
                        </div>

                        <div class="mb-3">
                            <label for="txtFechaRealizacion" class="form-label">Fecha Realización</label>
                            <asp:TextBox ID="txtFechaRealizacion" runat="server" CssClass="form-control" TextMode="Date" />
                        </div>

                        <div class="mb-3">
                            <label for="txtTecnico" class="form-label">Técnico Responsable</label>
                            <asp:TextBox ID="txtTecnico" runat="server" CssClass="form-control" MaxLength="100" />
                        </div>

                        <div class="mb-3">
                            <label for="ddlEstadoMantenimiento" class="form-label">Estado del Mantenimiento</label>
                            <asp:DropDownList ID="ddlEstadoMantenimiento" runat="server" CssClass="form-select" AppendDataBoundItems="True">
                                <asp:ListItem Text="Seleccione un estado..." Value="" />
                                <asp:ListItem Text="Programado" Value="Programado" />
                                <asp:ListItem Text="En Proceso" Value="En Proceso" />
                                <asp:ListItem Text="Completado" Value="Completado" />
                                <asp:ListItem Text="Cancelado" Value="Cancelado" />
                            </asp:DropDownList>
                        </div>
                    </asp:Panel>
                </div>
                <div class="modal-footer w-100 d-flex justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="BtnGuardarMantenimiento" runat="server" Text="Guardar" CssClass="btn btn-outline-success" />
                </div>
            </div>
        </div>
    </div>

    <!-- DataSource -->
    <asp:SqlDataSource ID="DS_Computadoras" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
        SelectCommand="SELECT id_computadora, nombre_equipo FROM Computadoras" />

    <asp:SqlDataSource ID="DS_Mantenimientos" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
        InsertCommand="INSERT INTO Mantenimientos(id_computadora, tipo, descripcion, fecha_programada, fecha_realizacion, tecnico_responsable, estado_mantenimiento) VALUES (@computadora, @tipo, @descripcion, @fecha, @fecharealizado, @tecnico, @estadomant)"
        SelectCommand="SELECT Mantenimientos.id_mantenimiento, Computadoras.nombre_equipo, Mantenimientos.tipo, Mantenimientos.descripcion, Mantenimientos.fecha_programada, Mantenimientos.fecha_realizacion, Mantenimientos.tecnico_responsable, Mantenimientos.estado_mantenimiento FROM Mantenimientos INNER JOIN Computadoras ON Mantenimientos.id_computadora = Computadoras.id_computadora" DeleteCommand="DELETE FROM Mantenimientos WHERE (id_mantenimiento = @id)" UpdateCommand="UPDATE Mantenimientos SET id_computadora = @computadora, tipo = @tipo, descripcion = @descripcion, fecha_programada = @fecha, fecha_realizacion = @fechare, tecnico_responsable = @tecnico, estado_mantenimiento = @estado WHERE (id_mantenimiento = @id)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GV_Mantenimiento" Name="id" PropertyName="SelectedValue" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="ddlComputadora" Name="computadora" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtTipo" Name="tipo" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtDescripcion" Name="descripcion" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtFechaProgramada" Name="fecha" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtFechaRealizacion" Name="fecharealizado" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtTecnico" Name="tecnico" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlEstadoMantenimiento" Name="estadomant" PropertyName="SelectedValue" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter Name="computadora" ControlID="ddlIdComputadoraUp" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtTipoUp" Name="tipo" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtDescripcionUp" Name="descripcion" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtFechaProgramadaUp" Name="fecha" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtFechaRealizacionUp" Name="fechare" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtTecnicoResponsableUp" Name="tecnico" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlEstadoMantenimientoUp" Name="estado" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtIdMantenimientoUp" Name="id" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!-- GridView -->
    <div class="table-responsive">
        <asp:GridView ID="GV_Mantenimiento" runat="server" AutoGenerateColumns="False" DataKeyNames="id_mantenimiento" DataSourceID="DS_Mantenimientos" CssClass="table table-bordered table-hover text-center table-striped w-100" OnRowDataBound="GV_Mantenimiento_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id_mantenimiento" HeaderText="#" ReadOnly="True" SortExpression="id_mantenimiento" />
                <asp:BoundField DataField="nombre_equipo" HeaderText="Equipo" SortExpression="nombre_equipo" />
                <asp:BoundField DataField="tipo" HeaderText="Tipo de mantenimiento" SortExpression="tipo" />
                <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="descripcion" />
                <asp:BoundField DataField="fecha_programada" HeaderText="Fecha programada" SortExpression="fecha_programada" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="fecha_realizacion" HeaderText="Fecha de realización" SortExpression="fecha_realizacion" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="tecnico_responsable" HeaderText="Técnico responsable" SortExpression="tecnico_responsable" />
                <asp:BoundField DataField="estado_mantenimiento" HeaderText="Estado del mantenimiento" SortExpression="estado_mantenimiento" />
                <asp:TemplateField HeaderText="Acciones">
                    <ItemTemplate>
                        <div class="d-flex gap-2 justify-content-center">
                            <asp:Button ID="BtnEditar" runat="server" Text="Editar" CommandName="Editar" CssClass="btn btn-outline-warning btn-sm"
                                OnClientClick="return confirm('¿Estás seguro de que deseas editar este mantenimiento?')" CommandArgument='<%# Eval("id_mantenimiento") %>' />
                            <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CssClass="btn btn-outline-danger btn-sm"
                                OnClientClick="return confirm('¿Estás seguro de que deseas eliminar este mantenimiento?')" CommandArgument='<%# Eval("id_mantenimiento") %>' OnRowDataBound="GV_Mantenimiento_RowDataBound"/>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>


<!-- Modal para actualizar mantenimiento -->
<asp:Panel ID="PanelActualizarMantenimiento" runat="server" Visible="false" CssClass="modal-content p-4 rounded shadow d-flex flex-column align-items-center">
    <div class="modal-header w-100 justify-content-center">
        <h5 class="modal-title text-center">Actualizar Mantenimiento</h5>
    </div>
    <div class="modal-body w-100 d-flex flex-column align-items-center">

        <!-- ID Mantenimiento (solo lectura) -->
        <div class="mb-3 w-100 text-center">
            <label for="txtIdMantenimientoUp" class="form-label">ID Mantenimiento</label>
            <asp:TextBox ID="txtIdMantenimientoUp" runat="server" CssClass="form-control mx-auto" Enabled="false" Style="max-width: 400px;" />
        </div>

        <!-- ID Computadora -->
    <div class="mb-3 w-100 text-center">
        <label for="ddlIdComputadoraUp" class="form-label">Computadora</label>
        <asp:DropDownList ID="ddlIdComputadoraUp" runat="server" CssClass="form-select mx-auto" Style="max-width: 400px;"
            DataSourceID="DS_Computadoras" DataTextField="nombre_equipo" DataValueField="id_computadora" AppendDataBoundItems="True">
        </asp:DropDownList>
    </div>

        <!-- Tipo -->
        <div class="mb-3 w-100 text-center">
            <label for="txtTipoUp" class="form-label">Tipo</label>
            <asp:TextBox ID="txtTipoUp" runat="server" CssClass="form-control mx-auto" MaxLength="50" Style="max-width: 400px;" />
        </div>

        <!-- Descripción -->
        <div class="mb-3 w-100 text-center">
            <label for="txtDescripcionUp" class="form-label">Descripción</label>
            <asp:TextBox ID="txtDescripcionUp" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control mx-auto" Style="max-width: 400px;" />
        </div>

        <!-- Fecha Programada -->
        <div class="mb-3 w-100 text-center">
            <label for="txtFechaProgramadaUp" class="form-label">Fecha Programada</label>
            <asp:TextBox ID="txtFechaProgramadaUp" runat="server" CssClass="form-control mx-auto" TextMode="Date" Style="max-width: 400px;" />
        </div>

        <!-- Fecha de Realización -->
        <div class="mb-3 w-100 text-center">
            <label for="txtFechaRealizacionUp" class="form-label">Fecha de Realización</label>
            <asp:TextBox ID="txtFechaRealizacionUp" runat="server" CssClass="form-control mx-auto" TextMode="Date" Style="max-width: 400px;" />
        </div>

        <!-- Técnico Responsable -->
        <div class="mb-3 w-100 text-center">
            <label for="txtTecnicoResponsableUp" class="form-label">Técnico Responsable</label>
            <asp:TextBox ID="txtTecnicoResponsableUp" runat="server" CssClass="form-control mx-auto" MaxLength="100" Style="max-width: 400px;" />
        </div>

        <!-- Estado del Mantenimiento -->
    <div class="mb-3 w-100 text-center">
        <label for="ddlEstadoMantenimientoUp" class="form-label">Estado</label>
        <asp:DropDownList ID="ddlEstadoMantenimientoUp" runat="server" CssClass="form-select mx-auto" Style="max-width: 400px;" AppendDataBoundItems="True">
            <asp:ListItem Text="Seleccione un estado..." Value="" />
            <asp:ListItem Text="Programado" Value="Programado" />
            <asp:ListItem Text="En Proceso" Value="En Proceso" />
            <asp:ListItem Text="Completado" Value="Completado" />
            <asp:ListItem Text="Cancelado" Value="Cancelado" />
        </asp:DropDownList>
    </div>
    </div>

    <div class="modal-footer w-100 d-flex justify-content-center">
        <asp:Button ID="btnCancelarMantenimiento" runat="server" Text="Cancelar" CssClass="btn btn-outline-secondary mx-2" />
        <asp:Button ID="btnActualizarMantenimiento" runat="server" Text="Guardar" CssClass="btn btn-outline-success mx-2" />
    </div>
</asp:Panel>

</asp:Content>
