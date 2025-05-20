'------------------------------------------------------------------------------
' <generado automáticamente>
'     Este código fue generado por una herramienta.
'
'     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
'     se vuelve a generar el código. 
' </generado automáticamente>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On


Partial Public Class Usuarios

    '''<summary>
    '''Control btnRegresar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnRegresar As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control PanelModalUsuario.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents PanelModalUsuario As Global.System.Web.UI.WebControls.Panel

    '''<summary>
    '''Control txtNombre.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtNombre As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtCorreo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtCorreo As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtUsuario.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtUsuario As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtContrasena.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtContrasena As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control ddlRol.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlRol As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control DS_Roles.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DS_Roles As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control ddlEstadoUsuario.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlEstadoUsuario As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control DS_EstadosUsuario.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DS_EstadosUsuario As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control BtnGuardarUsuario.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents BtnGuardarUsuario As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control DS_Usuarios.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DS_Usuarios As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control GV_Usuarios.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents GV_Usuarios As Global.System.Web.UI.WebControls.GridView

    '''<summary>
    '''Control PanelActualizarUsuario.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents PanelActualizarUsuario As Global.System.Web.UI.WebControls.Panel

    '''<summary>
    '''Control txtIdUsuarioUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtIdUsuarioUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtNombreUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtNombreUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtCorreoUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtCorreoUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtUsuarioUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtUsuarioUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtContrasenaUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtContrasenaUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control ddlRolUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlRolUp As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control ddlEstadoUsuarioUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlEstadoUsuarioUp As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control btnCancelarEdicionUsuario.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnCancelarEdicionUsuario As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control btnGuardarEdicionUsuario.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnGuardarEdicionUsuario As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control DS_ActualizarUsuario.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DS_ActualizarUsuario As Global.System.Web.UI.WebControls.SqlDataSource
End Class
