<%@ Page Title="Reservar" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Reservar.aspx.vb" Inherits="LabManager.Reservar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var reservaModal = new bootstrap.Modal(document.getElementById('reservaModal'));
            var btnGuardar = document.getElementById('btnGuardar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                locale: 'es',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                dateClick: function (info) {
                    document.getElementById('fecha').value = info.dateStr;
                    document.getElementById('id_laboratorio').value = "";
                    document.getElementById('hora_inicio').value = "";
                    document.getElementById('hora_fin').value = "";
                    document.getElementById('motivo').value = "";
                    reservaModal.show();
                }
            });
            calendar.render();

            btnGuardar.addEventListener('click', function () {
                // Validar formulario si quieres aquí

                var datos = {
                    id_usuario: document.getElementById('id_usuario').value,
                    id_estado: document.getElementById('id_estado').value,
                    id_laboratorio: document.getElementById('id_laboratorio').value,
                    fecha: document.getElementById('fecha').value,
                    hora_inicio: document.getElementById('hora_inicio').value,
                    hora_fin: document.getElementById('hora_fin').value,
                    motivo: document.getElementById('motivo').value
                };

                console.log("Datos a enviar:", datos);

                // Aquí puedes hacer la llamada AJAX para guardar en el servidor

                reservaModal.hide();
                alert('Reservación guardada (simulación).');
            });
        });

    </script>

    <div class="container my-5">
        <div class="row">
            <!-- Recuadro del calendario -->
            <div class="col-md-6 mb-3">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title">Calendario</h5>
                        <div id="calendar"></div>
                    </div>
                </div>
            </div>

<div class="modal fade" id="reservaModal" tabindex="-1" aria-labelledby="reservaModalLabel" aria-hidden="true">
  <div class="modal-dialog">
 
    <div id="formReserva" class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reservaModalLabel">Nueva Reservación</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <div class="modal-body">
        <input type="hidden" id="id_usuario" value="<%= Session("id_usuario") %>" />
        <input type="hidden" id="id_estado" value="1" />

        <div class="mb-3">
          <label for="id_laboratorio" class="form-label">Laboratorio</label>
          <select class="form-select" id="id_laboratorio" required>
            <option value="">Selecciona un laboratorio</option>
            <option value="1">Laboratorio 1</option>
            <option value="2">Laboratorio 2</option>
          </select>
        </div>

        <div class="mb-3">
          <label for="fecha" class="form-label">Fecha</label>
          <input type="date" class="form-control" id="fecha" required readonly />
        </div>

        <div class="mb-3">
          <label for="hora_inicio" class="form-label">Hora inicio</label>
          <input type="time" class="form-control" id="hora_inicio" required />
        </div>

        <div class="mb-3">
          <label for="hora_fin" class="form-label">Hora fin</label>
          <input type="time" class="form-control" id="hora_fin" required />
        </div>

        <div class="mb-3">
          <label for="motivo" class="form-label">Motivo</label>
          <textarea class="form-control" id="motivo" rows="3" required></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button id="btnGuardar" type="button" class="btn btn-primary">Guardar Reservación</button>
      </div>
    </div>
  </div>
</div>








            <!-- Recuadro del mensaje (con una card interna y una imagen) -->
            <div class="col-md-6 mb-3">
                <div class="card shadow-sm h-100 d-flex align-items-center justify-content-center bg-light">
                    <div class="card p-4 w-100 text-center" style="max-width: 100%;">
                        <img src="https://th.bing.com/th/id/OIP.0w_z96ycFfVyMaF0M6dh_wAAAA?rs=1&pid=ImgDetMain" 
                             alt="Función no disponible"
                             class="img-fluid mb-3" style="max-height: 100%;" />
                        <h5 class="card-title">Lo sentimos</h5>
                        <p class="card-text">Esta función estará disponible próximamente.</p>
                        <a href="Default.aspx" class="btn btn-primary mt-3 w-100">Regresar al inicio</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
