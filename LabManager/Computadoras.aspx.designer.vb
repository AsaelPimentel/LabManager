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


Partial Public Class Computadoras

    '''<summary>
    '''Control btnRegresar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnRegresar As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control PanelComputadora.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents PanelComputadora As Global.System.Web.UI.WebControls.Panel

    '''<summary>
    '''Control ddlLaboratorio.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlLaboratorio As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control DS_Laboratorios.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DS_Laboratorios As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control txtNombreEquipo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtNombreEquipo As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtFechaIngreso.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFechaIngreso As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control ddlEstadoEquipo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlEstadoEquipo As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control DS_Estados.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DS_Estados As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control BtnGuardarEquipo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents BtnGuardarEquipo As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control DS_Computadoras.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DS_Computadoras As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control DS_ActualizarPC.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DS_ActualizarPC As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control ddlFiltroEstado.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlFiltroEstado As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control btnFiltrarEstado.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnFiltrarEstado As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control ddlFiltroLaboratorio.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlFiltroLaboratorio As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control btnFiltrarLaboratorio.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnFiltrarLaboratorio As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control GV_Computadoras.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents GV_Computadoras As Global.System.Web.UI.WebControls.GridView

    '''<summary>
    '''Control PanelActualizarComputadora.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents PanelActualizarComputadora As Global.System.Web.UI.WebControls.Panel

    '''<summary>
    '''Control txtIdComputadoraUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtIdComputadoraUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control ddlLaboratorioUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlLaboratorioUp As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control DS_LabComp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DS_LabComp As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control txtNombreEquipoUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtNombreEquipoUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control txtFechaIngresoUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtFechaIngresoUp As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control ddlEstadoComputadoraUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents ddlEstadoComputadoraUp As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control DS_EstadosComp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents DS_EstadosComp As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control btnCancelarUp.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnCancelarUp As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control btnActualizarComputadora.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnActualizarComputadora As Global.System.Web.UI.WebControls.Button
End Class
