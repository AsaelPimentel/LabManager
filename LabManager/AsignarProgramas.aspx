<%@ Page Title="Asignar Programas" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AsignarProgramas.aspx.vb" Inherits="LabManager.AsignarProgramas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- menu con bootn regresar y encabezado del formulario -->
    <div class="container-fluid mt-3">
        <div class="row align-items-center  border p-3">
            <div class="col-4 text-start">
                <asp:Button ID="btnRegresar" runat="server" CssClass="btn btn-secondary" Text="Regresar" PostBackUrl="~/Administracion.aspx" />
            </div>
            <div class="col-4 text-center">
                <h4 class="m-0">Asignación de Programas</h4>
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
            <i class="fas fa-plus"></i>&nbsp;Asignar nuevo programa
        </button>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Asignar nuevo programa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4 rounded d-flex flex-column align-items-center">
                    <asp:Panel ID="PanelModal" runat="server">

                        <!-- Formulario de asignación dentro del modal -->
                        <div class="mb-3 row">
                            <label class="col-sm-4 col-form-label">Laboratorio</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlLaboratorio" runat="server" CssClass="form-select"
                                    AutoPostBack="True" DataSourceID="DS_Laboratorios"
                                    DataTextField="nombre" DataValueField="id_laboratorio" />
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label class="col-sm-4 col-form-label">Computadora</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlComputadora" runat="server" CssClass="form-select"
                                    DataSourceID="DS_Computadoras" DataTextField="nombre_equipo" DataValueField="id_computadora" />
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label class="col-sm-4 col-form-label">Programa</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlPrograma" runat="server" CssClass="form-select"
                                    DataSourceID="DS_Programas" DataTextField="nombre" DataValueField="id_programa" />
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label class="col-sm-4 col-form-label">Fecha instalación</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date" />
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label class="col-sm-4 col-form-label">Estado</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-select"
                                    DataSourceID="DS_Estados" DataTextField="nombre_estado" DataValueField="id_estado" />
                            </div>
                        </div>

                    </asp:Panel>
                </div>
                <div class="modal-footer w-100 d-flex justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-outline-success" />
                </div>
            </div>
        </div>
    </div>

    <!-- DataSources -->
    <asp:SqlDataSource ID="DS_Laboratorios" runat="server"
        ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
        SelectCommand="SELECT id_laboratorio, nombre FROM laboratorios" />

    <asp:SqlDataSource ID="DS_Computadoras" runat="server"
        ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
        SelectCommand="SELECT id_computadora, nombre_equipo FROM computadoras WHERE id_laboratorio = @id_laboratorio">
        <SelectParameters>
            <asp:ControlParameter Name="id_laboratorio" ControlID="ddlLaboratorio" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_Programas" runat="server"
        ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
        SelectCommand="SELECT id_programa, nombre FROM programas WHERE id_estado = 1" />

    <asp:SqlDataSource ID="DS_Estados" runat="server"
        ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
        SelectCommand="SELECT id_estado, nombre_estado FROM estados" />


    <asp:SqlDataSource ID="DS_Asignaciones" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" InsertCommand="INSERT INTO Computadoras_Programas(id_computadora, id_programa, fecha_instalacion, id_estado) VALUES (@compu, @programa, @fecha, @estado)" SelectCommand="SELECT cp.id_asignacion,c.id_laboratorio,l.nombre AS nombre_laboratorio,cp.id_computadora,c.nombre_equipo,cp.id_programa,p.nombre AS nombre_programa,p.version_programa,p.licencia,p.descripcion,cp.fecha_instalacion,cp.id_estado,e.nombre_estado FROM Computadoras_Programas cp INNER JOIN Computadoras c ON cp.id_computadora = c.id_computadora INNER JOIN Laboratorios l ON c.id_laboratorio = l.id_laboratorio INNER JOIN Programas p ON cp.id_programa = p.id_programa INNER JOIN Estados e ON cp.id_estado = e.id_estado" UpdateCommand="UPDATE Computadoras_Programas SET WHERE (id_asignacion = @asignacion)">
        <InsertParameters>
            <asp:ControlParameter ControlID="ddlComputadora" Name="compu" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="ddlPrograma" Name="programa" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtFecha" Name="fecha" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlEstado" Name="estado" PropertyName="SelectedValue" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GV_Asignaciones" Name="asignacion" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>



    <asp:GridView ID="GV_Asignaciones" runat="server" AllowPaging="True" DataSourceID="DS_Asignaciones" CssClass="table table-bordered table-hover table-responsive text-center table-striped" AutoGenerateColumns="False" DataKeyNames="id_asignacion">
        <Columns>
            <asp:BoundField DataField="id_asignacion" HeaderText="#" SortExpression="id_asignacion" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="nombre_laboratorio" HeaderText="Laboratorio" SortExpression="nombre_laboratorio" />
            <asp:BoundField DataField="nombre_equipo" HeaderText="Computadora" SortExpression="nombre_equipo" />
            <asp:BoundField DataField="nombre_programa" HeaderText="Programa" SortExpression="nombre_programa" />
            <asp:BoundField DataField="version_programa" HeaderText="Versión" SortExpression="version_programa" />
            <asp:BoundField DataField="licencia" HeaderText="Licencia" SortExpression="licencia" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="descripcion" />
            <asp:BoundField DataField="fecha_instalacion" HeaderText="Fecha de Instalación" SortExpression="fecha_instalacion" />
            <asp:BoundField DataField="nombre_estado" HeaderText="Estado" SortExpression="nombre_estado" />
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="BtnEditar" runat="server" Text="Editar" CommandName="Editar"
                        OnClientClick="return confirm('¿Estás seguro de que deseas editar esta asignación?')"
                        CssClass="btn btn-outline-warning btn-sm"
                        CommandArgument='<%# Eval("id_asignacion") %>' />
                    &nbsp;
                <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar"
                    OnClientClick="return confirm('¿Estás seguro de que deseas eliminar esta asignación?')"
                    CssClass="btn btn-outline-danger btn-sm"
                    CommandArgument='<%# Eval("id_asignacion") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Panel ID="PnlActulizarAsignacion" runat="server" Visible="false">

        <div class="container mt-4">
            <div class="row justify-content-center">
                <div class="col-md-8 border p-4 rounded shadow bg-white">

                    <div class="mb-3 row">
                        <label class="col-sm-4 col-form-label">ID Asignación</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtIdAsignacion" runat="server" CssClass="form-control" ReadOnly="True" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label class="col-sm-4 col-form-label">Computadora</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="ddlEditComputadora" runat="server" CssClass="form-select"
                                DataSourceID="DS_EditComputadoras" DataTextField="nombre_equipo" DataValueField="id_computadora" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label class="col-sm-4 col-form-label">Programa</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="ddlEditPrograma" runat="server" CssClass="form-select"
                                DataSourceID="DS_Programas" DataTextField="nombre" DataValueField="id_programa" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label class="col-sm-4 col-form-label">Fecha instalación</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtEditFecha" runat="server" CssClass="form-control" TextMode="Date" />
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label class="col-sm-4 col-form-label">Estado</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="ddlEditEstado" runat="server" CssClass="form-select"
                                DataSourceID="DS_Estados" DataTextField="nombre_estado" DataValueField="id_estado" />
                        </div>
                    </div>

                    <div class="text-center">
                        <asp:Button ID="btnEditCancelar" runat="server" Text="Cancelar" CssClass="btn btn-warning" />
                        <asp:Button ID="btnEditGuardar" runat="server" Text="Guardar Cambios" CssClass="btn btn-success" />
                    </div>

                </div>
            </div>
        </div>

        <!-- El SqlDataSource para el EditComputadora exclusivo -->
        <asp:SqlDataSource ID="DS_EditComputadoras" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>"
            SelectCommand="SELECT id_computadora, nombre_equipo FROM Computadoras"></asp:SqlDataSource>


        <asp:SqlDataSource ID="DS_EditAsignaciones" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT * FROM [Computadoras_Programas]" UpdateCommand="UPDATE Computadoras_Programas SET id_computadora = @computadora, id_programa = @programa, fecha_instalacion = @fecha, id_estado = @estado WHERE (id_asignacion = @asignacion)">
            <UpdateParameters>
                <asp:ControlParameter Name="computadora" ControlID="ddlEditComputadora" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddlEditPrograma" Name="programa" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txtEditFecha" Name="fecha" PropertyName="Text" />
                <asp:ControlParameter ControlID="ddlEditEstado" Name="estado" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txtIdAsignacion" Name="asignacion" PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </asp:Panel>

</asp:Content>
