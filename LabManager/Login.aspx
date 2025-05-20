<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="LabManager.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>LabManager | Iniciar Sesión</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- FontAwesome 6 CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="Css/Estilos.css" />
</head>

<body>
    <form id="form1" runat="server">
        <div class="d-flex align-items-center justify-content-center vh-100">
            <div class="login-container text-center position-relative">
                <img src="IMG/LogoInstitucional2.png" alt="Logo" class="login-image" />
                <h2 class="mb-4">Iniciar Sesión</h2>

                <div class="mb-3 position-relative">
                    <label for="txtUsuario" class="form-label">Usuario</label>
                    <i class="fas fa-user input-icon"></i>
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="@uabc.edu.mx"></asp:TextBox>
                </div>

                <div class="mb-4 position-relative">
                    <label for="txtContrasena" class="form-label">Contraseña</label>
                    <i class="fas fa-lock input-icon"></i>
                    <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" CssClass="form-control" placeholder="Contraseña"></asp:TextBox>
                </div>

                <asp:Button ID="btnIniciarSesion" runat="server" Text=" Iniciar Sesión" CssClass="btn btn-primary w-100" />
                <asp:SqlDataSource ID="DS_Login" runat="server" ConnectionString="<%$ ConnectionStrings:CS_LabManager %>" SelectCommand="SELECT * FROM [Usuarios] WHERE (([usuario] = @usuario) AND ([contrasena] = @contrasena))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtUsuario" Name="usuario" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtContrasena" Name="contrasena" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>




    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
