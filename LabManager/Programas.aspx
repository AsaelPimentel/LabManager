<%@ Page Title="Programas" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Programas.aspx.vb" Inherits="LabManager.Programas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- menu con bootn regresar y encabezado del formulario -->
    <div class="container-fluid mt-3">
        <div class="row align-items-center  border p-3">
            <div class="col-4 text-start">
                <asp:Button ID="btnRegresar" runat="server" CssClass="btn btn-secondary" Text="Regresar" PostBackUrl="~/Administracion.aspx" />
            </div>
            <div class="col-4 text-center">
                <h4 class="m-0">Programas</h4>
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
            <i class="fas fa-code"></i>&nbsp;Agregar Nuevo programa
        </button>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar un nuevo programa</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4 rounded d-flex flex-column align-items-center">
                    <asp:Panel ID="PanelModal" runat="server">
                        <div class="mb-3">
                            <label for="txtNombrePrograma" class="form-label">Nombre</label>
                            <asp:TextBox ID="txtNombrePrograma" runat="server" CssClass="form-control" MaxLength="100" />
                        </div>

                        <div class="mb-3">
                            <label for="txtVersionPrograma" class="form-label">Versión</label>
                            <asp:TextBox ID="txtVersionPrograma" runat="server" CssClass="form-control" MaxLength="50" />
                        </div>

                        <div class="mb-3">
                            <label for="txtLicencia" class="form-label">Licencia</label>
                            <asp:TextBox ID="txtLicencia" runat="server" CssClass="form-control" MaxLength="50" />
                        </div>

                        <div class="mb-3">
                            <label for="txtDescripcion" class="form-label">Descripción</label>
                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                        </div>

                        <div class="mb-3">
                            <label for="ddlEstadoPrograma" class="form-label">Estado</label>
                            <asp:DropDownList ID="ddlEstadoPrograma" runat="server" CssClass="form-select" AppendDataBoundItems="True" DataSourceID="DS_Estados" DataTextField="nombre_estado" DataValueField="id_estado">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DS_Estados" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT * FROM [Estados]"></asp:SqlDataSource>
                        </div>
                    </asp:Panel>
                </div>
                <div class="modal-footer w-100 d-flex justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="BtnGuardarPrograma" runat="server" Text="Guardar" CssClass="btn btn-outline-success" />
                </div>
            </div>
        </div>
    </div>


    <asp:SqlDataSource ID="DS_Programas" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" InsertCommand="INSERT INTO Programas(nombre, version_programa, licencia, descripcion, id_estado) VALUES (@nombre, @version, @licencia, @descripcion, @estado)" SelectCommand="SELECT Programas.id_programa, Programas.nombre, Programas.version_programa, Programas.licencia, Programas.descripcion, Estados.nombre_estado FROM Programas INNER JOIN Estados ON Programas.id_estado = Estados.id_estado" UpdateCommand="UPDATE Programas SET WHERE (id_programa = @id)">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtNombrePrograma" Name="nombre" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtVersionPrograma" Name="version" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtLicencia" Name="licencia" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtDescripcion" Name="descripcion" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlEstadoPrograma" DefaultValue="1" Name="estado" PropertyName="SelectedValue" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GV_Programas" Name="id" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GV_Programas" runat="server" AllowPaging="True" DataSourceID="DS_Programas" CssClass="table table-bordered table-hover table-responsive text-center table-striped" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="id_programa" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_programa" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
            <asp:BoundField DataField="version_programa" HeaderText="Version" SortExpression="version_programa" />
            <asp:BoundField DataField="licencia" HeaderText="Licencia" SortExpression="licencia" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" SortExpression="descripcion" />
            <asp:BoundField DataField="nombre_estado" HeaderText="Estado" SortExpression="nombre_estado" />
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="BtnEditar" runat="server" Text="Editar" CommandName="Editar" OnClientClick="return confirm('¿Estás seguro de que deseas editar este programa?')" CssClass="btn btn-outline-warning btn-sm" CommandArgument='<%# Eval("id_programa") %>' />
                    &nbsp;&nbsp;
                    <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" OnClientClick="return confirm('¿Estás seguro de que deseas eliminar este programa?')" CssClass="btn btn-outline-danger btn-sm" CommandArgument='<%# Eval("id_programa") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


    <asp:Panel ID="PanelActualizarPrograma" runat="server" Visible="false" CssClass="modal-content p-4 rounded shadow justify-content-center align-items-center">
        <div class="modal-header justify-content-center">
            <h5 class="modal-title">Actualizar Programa</h5>
        </div>
        <div class="modal-body ">
            <asp:TextBox ID="txtIdProgramaUp" runat="server" CssClass="form-control mb-2 text-center" Enabled="false" Placeholder="ID Programa" />
            <asp:TextBox ID="txtNombreProgramaUp" runat="server" CssClass="form-control mb-2" MaxLength="100" Placeholder="Nombre" />
            <asp:TextBox ID="txtVersionProgramaUp" runat="server" CssClass="form-control mb-2" MaxLength="50" Placeholder="Versión" />
            <asp:TextBox ID="txtLicenciaUp" runat="server" CssClass="form-control mb-2" MaxLength="50" Placeholder="Licencia" />
            <asp:TextBox ID="txtDescripcionUp" runat="server" CssClass="form-control mb-2" TextMode="MultiLine" Rows="3" Placeholder="Descripción" />
            <asp:DropDownList ID="ddlEstadoProgramaUp" runat="server" CssClass="form-select mb-2"
                DataSourceID="DS_Estados" DataTextField="nombre_estado" DataValueField="id_estado" />
        </div>
        <div class="modal-footer justify-content-center">
            <asp:Button ID="btnCancelarEdicionPrograma" runat="server" Text="Cancelar" CssClass="btn btn-secondary mx-1" />
            <asp:Button ID="btnGuardarEdicionPrograma" runat="server" Text="Guardar" CssClass="btn btn-success mx-1" />
        </div>
    </asp:Panel>
    <asp:SqlDataSource ID="DS_ProgramaUp" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT * FROM [Programas]" UpdateCommand="UPDATE Programas SET nombre = @nombre, version_programa = @version, licencia = @licencia, descripcion = @descripcion, id_estado = @estado WHERE (id_programa = @id)">
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtNombreProgramaUp" Name="nombre" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtVersionProgramaUp" Name="version" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtLicenciaUp" Name="licencia" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtDescripcionUp" Name="descripcion" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlEstadoProgramaUp" Name="estado" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtIdProgramaUp" Name="id" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>



</asp:Content>
