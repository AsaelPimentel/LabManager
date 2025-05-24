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


Partial Public Class Mantenimientos

    '''<summary>
    '''Control btnRegresar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnRegresar As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control PanelModalMantenimiento.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents PanelModalMantenimiento As Global.System.Web.UI.WebControls.Panel

    '''<summary>
    '''Control ddlComputadora.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlComputadora As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control txtTipo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtTipo As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtDescripcion.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtDescripcion As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtFechaProgramada.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFechaProgramada As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtFechaRealizacion.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFechaRealizacion As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtTecnico.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtTecnico As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control ddlEstadoMantenimiento.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlEstadoMantenimiento As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control BtnGuardarMantenimiento.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents BtnGuardarMantenimiento As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control DS_Computadoras.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DS_Computadoras As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control DS_Mantenimientos.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DS_Mantenimientos As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control GV_Mantenimiento.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents GV_Mantenimiento As Global.System.Web.UI.WebControls.GridView

    '''<summary>
    '''Control PanelActualizarMantenimiento.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents PanelActualizarMantenimiento As Global.System.Web.UI.WebControls.Panel

    '''<summary>
    '''Control txtIdMantenimientoUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtIdMantenimientoUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control ddlIdComputadoraUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlIdComputadoraUp As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control txtTipoUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtTipoUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtDescripcionUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtDescripcionUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtFechaProgramadaUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFechaProgramadaUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtFechaRealizacionUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFechaRealizacionUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtTecnicoResponsableUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtTecnicoResponsableUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control ddlEstadoMantenimientoUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlEstadoMantenimientoUp As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control btnCancelarMantenimiento.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnCancelarMantenimiento As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control btnActualizarMantenimiento.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnActualizarMantenimiento As Global.System.Web.UI.WebControls.Button
End Class
