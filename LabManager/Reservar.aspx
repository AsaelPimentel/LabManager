<%@ Page Title="Reservar" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Reservar.aspx.vb" Inherits="LabManager.Reservar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                locale: 'es',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                }
            });
            calendar.render();
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

            <!-- Recuadro del mensaje (con una card interna y una imagen) -->
            <div class="col-md-6 mb-3">
                <div class="card shadow-sm h-100 d-flex align-items-center justify-content-center bg-light">
                    <div class="card p-4 w-100 text-center" style="max-width: 100%;">
                        <img src="https://th.bing.com/th/id/OIP.0w_z96ycFfVyMaF0M6dh_wAAAA?rs=1&pid=ImgDetMain" 
                             alt="Función no disponible"
                             class="img-fluid mb-3" style="max-height: 100%;" />
                        <h5 class="card-title">Lo sentimos</h5>
                        <p class="card-text">Esta función estará disponible próximamente.</p>
                        <a href="Inicio.aspx" class="btn btn-primary mt-3 w-100">Regresar al inicio</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
