<%@ Page Title="Usuarios" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Usuarios.aspx.vb" Inherits="LabManager.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <!-- menu con bootn regresar y encabezado del formulario -->
    <div class="container-fluid mt-3">
        <div class="row align-items-center  border p-3">
            <div class="col-4 text-start">
                <asp:Button ID="btnRegresar" runat="server" CssClass="btn btn-secondary" Text="Regresar" PostBackUrl="~/Administracion.aspx" />
            </div>
            <div class="col-4 text-center">
                <h4 class="m-0">Usuarios</h4>
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
            <i class="fas fa-users"></i>&nbsp;Agregar Nuevo usuario
        </button>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Registrar nuevo usuario</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4 rounded d-flex flex-column align-items-center">
                    <asp:Panel ID="PanelModalUsuario" runat="server">
                        <div class="mb-3">
                            <label for="txtNombre" class="form-label">Nombre</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" MaxLength="100" />
                        </div>

                        <div class="mb-3">
                            <label for="txtCorreo" class="form-label">Correo</label>
                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" MaxLength="100" TextMode="Email" />
                        </div>

                        <div class="mb-3">
                            <label for="txtUsuario" class="form-label">Usuario</label>
                            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" MaxLength="100" />
                        </div>

                        <div class="mb-3">
                            <label for="txtContrasena" class="form-label">Contraseña</label>
                            <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" MaxLength="100" TextMode="Password" />
                        </div>

                        <div class="mb-3">
                            <label for="ddlRol" class="form-label">Rol</label>
                            <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-select" AppendDataBoundItems="True" DataSourceID="DS_Roles" DataTextField="nombre_rol" DataValueField="id_rol">
                                <asp:ListItem Text="Seleccione un rol..." Value="" />
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DS_Roles" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT id_rol, nombre_rol FROM Roles"></asp:SqlDataSource>
                        </div>

                        <div class="mb-3">
                            <label for="ddlEstadoUsuario" class="form-label">Estado</label>
                            <asp:DropDownList ID="ddlEstadoUsuario" runat="server" CssClass="form-select" AppendDataBoundItems="True" DataSourceID="DS_EstadosUsuario" DataTextField="nombre_estado" DataValueField="id_estado">
                                <asp:ListItem Text="Seleccione un estado..." Value="" />
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DS_EstadosUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT id_estado, nombre_estado FROM Estados WHERE nombre_estado IN ('Disponible', 'Pendiente', 'Dado de Baja')"></asp:SqlDataSource>
                        </div>
                    </asp:Panel>
                </div>
                <div class="modal-footer w-100 d-flex justify-content-center">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <asp:Button ID="BtnGuardarUsuario" runat="server" Text="Guardar" CssClass="btn btn-outline-success" />
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="DS_Usuarios" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" InsertCommand="INSERT INTO Usuarios(nombre, correo, usuario, contrasena, id_rol, id_estado) VALUES (@nombre, @correo, @usuario, @contrasena, @rol, @estado)" SelectCommand="SELECT Usuarios.id_usuario, Usuarios.nombre, Usuarios.correo, Usuarios.usuario, Roles.nombre_rol, Estados.nombre_estado FROM Usuarios INNER JOIN Roles ON Usuarios.id_rol = Roles.id_rol INNER JOIN Estados ON Usuarios.id_estado = Estados.id_estado">
        <InsertParameters>
            <asp:ControlParameter ControlID="txtNombre" Name="nombre" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtCorreo" Name="correo" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtUsuario" Name="usuario" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtContrasena" Name="contrasena" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlRol" DefaultValue="1" Name="rol" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="ddlEstadoUsuario" DefaultValue="6" Name="estado" PropertyName="SelectedValue" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GV_Usuarios" runat="server" CssClass="table table-bordered table-hover table-responsive text-center table-striped" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id_usuario" DataSourceID="DS_Usuarios">
        <Columns>
            <asp:BoundField DataField="id_usuario" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_usuario" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
            <asp:BoundField DataField="correo" HeaderText="Correo" SortExpression="correo" />
            <asp:BoundField DataField="usuario" HeaderText="Usuario" SortExpression="usuario" />
            <asp:BoundField DataField="nombre_rol" HeaderText="Cargo" SortExpression="nombre_rol" />
            <asp:BoundField DataField="nombre_estado" HeaderText="Estados" SortExpression="nombre_estado" />
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:Button ID="BtnEditar" runat="server" Text="Editar" CommandName="Editar" OnClientClick="return confirm('¿Estás seguro de que deseas editar este usuario?')" CssClass="btn btn-outline-warning btn-sm" CommandArgument='<%# Eval("id_usuario") %>' />
                    &nbsp;&nbsp;
                    <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" OnClientClick="return confirm('¿Estás seguro de que deseas eliminar este usuario?')" CssClass="btn btn-outline-danger btn-sm" CommandArgument='<%# Eval("id_usuario") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Panel ID="PanelActualizarUsuario" runat="server" Visible="false" CssClass="modal-content p-4 rounded shadow justify-content-center align-items-center">
        <div class="modal-header justify-content-center">
            <h5 class="modal-title">Actualizar Usuario</h5>
        </div>
        <div class="modal-body">
            <asp:TextBox ID="txtIdUsuarioUp" runat="server" CssClass="form-control mb-2 text-center" Enabled="false" Placeholder="ID Usuario" />

            <asp:TextBox ID="txtNombreUp" runat="server" CssClass="form-control mb-2" MaxLength="100" Placeholder="Nombre" />

            <asp:TextBox ID="txtCorreoUp" runat="server" CssClass="form-control mb-2" MaxLength="100" TextMode="Email" Placeholder="Correo" />

            <asp:TextBox ID="txtUsuarioUp" runat="server" CssClass="form-control mb-2" MaxLength="100" Placeholder="Usuario" />

            <asp:TextBox ID="txtContrasenaUp" runat="server" CssClass="form-control mb-2" MaxLength="100" TextMode="Password" Placeholder="Contraseña" />
            <input type="checkbox" onclick="togglePassword()" checked >
            Mostrar contraseña

            <script>
                function togglePassword() {
                    var input = document.getElementById('<%= txtContrasenaUp.ClientID %>');
                    input.type = (input.type === "password") ? "text" : "password";
                }
            </script>

            <asp:DropDownList ID="ddlRolUp" runat="server" CssClass="form-select mb-2"
                DataSourceID="DS_Roles" DataTextField="nombre_rol" DataValueField="id_rol" AppendDataBoundItems="True">
                <asp:ListItem Text="Seleccione un rol..." Value="" />
            </asp:DropDownList>

            <asp:DropDownList ID="ddlEstadoUsuarioUp" runat="server" CssClass="form-select mb-2"
                DataSourceID="DS_EstadosUsuario" DataTextField="nombre_estado" DataValueField="id_estado" AppendDataBoundItems="True">
                <asp:ListItem Text="Seleccione un estado..." Value="" />
            </asp:DropDownList>
        </div>
        <div class="modal-footer justify-content-center">
            <asp:Button ID="btnCancelarEdicionUsuario" runat="server" Text="Cancelar" CssClass="btn btn-secondary mx-1" />
            <asp:Button ID="btnGuardarEdicionUsuario" runat="server" Text="Guardar" CssClass="btn btn-success mx-1" />
        </div>
    </asp:Panel>

    <asp:SqlDataSource ID="DS_ActualizarUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT * FROM [Usuarios]" UpdateCommand="UPDATE Usuarios SET nombre = @nombre, correo = @correo, usuario = @usuario, contrasena = @contrasena, id_rol = @rol, id_estado = @estado WHERE (id_usuario = @id_usuario)">
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtNombreUp" Name="nombre" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtCorreoUp" Name="correo" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtUsuarioUp" Name="usuario" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtContrasenaUp" Name="contrasena" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlRolUp" Name="rol" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="ddlEstadoUsuarioUp" Name="estado" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtIdUsuarioUp" Name="id_usuario" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
