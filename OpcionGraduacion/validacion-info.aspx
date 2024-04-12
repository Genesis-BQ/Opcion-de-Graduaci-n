<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="validacion-info.aspx.cs" Inherits="OpcionGraduacion.validacion_info" %>

<!DOCTYPE html>

<html lang="es">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Validacion Información</title>
    <link rel="stylesheet" href="./CSS/style.css" />
    <link rel="stylesheet" href="./CSS/style-validacion-info.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <!-- Agregamos Font Awesome -->
</head>
<body>
    <form id="form1" runat="server">
       <header>
            <img src="./img/download-removebg-preview (1).png" />
            <h1 style="color: white;">ARAYA LEANDRO SANTIAGO ANDRES</h1>
            <asp:LinkButton ID="BtnCerrarSesion" runat="server" CssClass="Btn" >
                <div class="sign">
                    <svg viewBox="0 0 512 512">
                        <path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path>
                    </svg>
                </div>
                <div class="text">Cerrar Sesión</div>
            </asp:LinkButton>
        </header>

        <div class="search-container">
            <asp:TextBox ID="myInput" runat="server" onkeyup="filterTable()" placeholder="Buscar por estudiante..."></asp:TextBox>
            <span class="clear-input" onclick="clearInput()">
                <i class="fas fa-trash-alt"></i>
            </span>
        </div>

        <table id="myTable">
            <thead>
                <tr>
                    <th>Estudiante</th>
                    <th>Carrera</th>
                    <th>Formulario</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>305470977</td>
                    <td>Tecnología de la Información</td>
                    <td>
                        <a href="#" class="ver-link" onclick="toggleModal('305470977', 'Nombre1', 'Apellido1', 'Tecnología de la Información', 'Opción1', '123456789')">
                            <i class="fas fa-eye"></i> Ver...
                        </a>
                    </td>

                  <td> <!-- Celda de acciones -->
    <button class="button" style="--clr: #00ad54;" onclick="aceptar('305470977')">
        <span class="button-decor"></span>
        <div class="button-content">
            <div class="button__icon">
                <svg viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg" width="24">
                    <circle opacity="0.5" cx="25" cy="25" r="23" fill="url(#icon-payments-cat_svg__paint0_linear_1141_21101)"></circle>
                    <mask id="icon-payments-cat_svg__a" fill="#fff">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M34.42 15.93c.382-1.145-.706-2.234-1.851-1.852l-18.568 6.189c-1.186.395-1.362 2-.29 2.644l5.12 3.072a1.464 1.464 0 001.733-.167l5.394-4.854a1.464 1.464 0 011.958 2.177l-5.154 4.638a1.464 1.464 0 00-.276 1.841l3.101 5.17c.644 1.072 2.25.896 2.645-.29L34.42 15.93z">
                        </path>
                    </mask>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M34.42 15.93c.382-1.145-.706-2.234-1.851-1.852l-18.568 6.189c-1.186.395-1.362 2-.29 2.644l5.12 3.072a1.464 1.464 0 001.733-.167l5.394-4.854a1.464 1.464 0 011.958 2.177l-5.154 4.638a1.464 1.464 0 00-.276 1.841l3.101 5.17c.644 1.072 2.25.896 2.645-.29L34.42 15.93z" fill="#fff"></path>
                    <path d="M25.958 20.962l-1.47-1.632 1.47 1.632zm2.067.109l-1.632 1.469 1.632-1.469zm-.109 2.068l-1.469-1.633 1.47 1.633zm-5.154 4.638l-1.469-1.632 1.469 1.632zm-.276 1.841l-1.883 1.13 1.883-1.13zM34.42 15.93l-2.084-.695 2.084.695zm-19.725 6.42l18.568-6.189-1.39-4.167-18.567 6.19 1.389 4.166zm5.265 1.75l-5.12-3.072-2.26 3.766 5.12 3.072 2.26-3.766zm2.072 3.348l5.394-4.854-2.938-3.264-5.394 4.854 2.938 3.264zm5.394-4.854a.732.732 0 01-1.034-.054l3.265-2.938a3.66 3.66 0 00-5.17-.272l2.939 3.265zm-1.034-.054a.732.732 0 01.054-1.034l2.938 3.265a3.66 3.66 0 00.273-5.169l-3.265 2.938zm.054-1.034l-5.154 4.639 2.938 3.264 5.154-4.638-2.938-3.265zm1.023 12.152l-3.101-5.17-3.766 2.26 3.101 5.17 3.766-2.26zm4.867-18.423l-6.189 18.568 4.167 1.389 6.19-18.568-4.168-1.389zm-8.633 20.682c1.61 2.682 5.622 2.241 6.611-.725l-4.167-1.39a.732.732 0 011.322-.144l-3.766 2.26zm-6.003-8.05a3.66 3.66 0 004.332-.419l-2.938-3.264a.732.732 0 01.866-.084l-2.26 3.766zm3.592-1.722a3.66 3.66 0 00-.69 4.603l3.766-2.26c.18.301.122.687-.138.921l-2.938-3.264zm11.97-9.984a.732.732 0 01-.925-.926l4.166 1.389c.954-2.861-1.768-5.583-4.63-4.63l1.39 4.167zm-19.956 2.022c-2.967.99-3.407 5.003-.726 6.611l2.26-3.766a.732.732 0 01-.145 1.322l-1.39-4.167z" fill="#fff" mask="url(#icon-payments-cat_svg__a)"></path>
                    <defs>
                        <linearGradient id="icon-payments-cat_svg__paint0_linear_1141_21101" x1="25" y1="2" x2="25" y2="48" gradientUnits="userSpaceOnUse">
                            <stop stop-color="#fff" stop-opacity="0.71"></stop>
                            <stop offset="1" stop-color="#fff" stop-opacity="0"></stop>
                        </linearGradient>
                    </defs>
                </svg>
            </div>
            <span class="button__text">Aceptar</span>
        </div>
    </button>

    <button class="button" style="--clr: #ad0000;" onclick="aceptar('305470977')">
    <span class="button-decor"></span>
    <div class="button-content">
        <div class="button__icon">
            <svg viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg" width="24">
                <circle opacity="0.5" cx="25" cy="25" r="23" fill="url(#icon-payments-cat_svg__paint0_linear_1141_21101)"></circle>
                <mask id="icon-payments-cat_svg__a" fill="#fff">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M34.42 15.93c.382-1.145-.706-2.234-1.851-1.852l-18.568 6.189c-1.186.395-1.362 2-.29 2.644l5.12 3.072a1.464 1.464 0 001.733-.167l5.394-4.854a1.464 1.464 0 011.958 2.177l-5.154 4.638a1.464 1.464 0 00-.276 1.841l3.101 5.17c.644 1.072 2.25.896 2.645-.29L34.42 15.93z">
                    </path>
                </mask>
                <path fill-rule="evenodd" clip-rule="evenodd" d="M34.42 15.93c.382-1.145-.706-2.234-1.851-1.852l-18.568 6.189c-1.186.395-1.362 2-.29 2.644l5.12 3.072a1.464 1.464 0 001.733-.167l5.394-4.854a1.464 1.464 0 011.958 2.177l-5.154 4.638a1.464 1.464 0 00-.276 1.841l3.101 5.17c.644 1.072 2.25.896 2.645-.29L34.42 15.93z" fill="#fff"></path>
                <path d="M25.958 20.962l-1.47-1.632 1.47 1.632zm2.067.109l-1.632 1.469 1.632-1.469zm-.109 2.068l-1.469-1.633 1.47 1.633zm-5.154 4.638l-1.469-1.632 1.469 1.632zm-.276 1.841l-1.883 1.13 1.883-1.13zM34.42 15.93l-2.084-.695 2.084.695zm-19.725 6.42l18.568-6.189-1.39-4.167-18.567 6.19 1.389 4.166zm5.265 1.75l-5.12-3.072-2.26 3.766 5.12 3.072 2.26-3.766zm2.072 3.348l5.394-4.854-2.938-3.264-5.394 4.854 2.938 3.264zm5.394-4.854a.732.732 0 01-1.034-.054l3.265-2.938a3.66 3.66 0 00-5.17-.272l2.939 3.265zm-1.034-.054a.732.732 0 01.054-1.034l2.938 3.265a3.66 3.66 0 00.273-5.169l-3.265 2.938zm.054-1.034l-5.154 4.639 2.938 3.264 5.154-4.638-2.938-3.265zm1.023 12.152l-3.101-5.17-3.766 2.26 3.101 5.17 3.766-2.26zm4.867-18.423l-6.189 18.568 4.167 1.389 6.19-18.568-4.168-1.389zm-8.633 20.682c1.61 2.682 5.622 2.241 6.611-.725l-4.167-1.39a.732.732 0 011.322-.144l-3.766 2.26zm-6.003-8.05a3.66 3.66 0 004.332-.419l-2.938-3.264a.732.732 0 01.866-.084l-2.26 3.766zm3.592-1.722a3.66 3.66 0 00-.69 4.603l3.766-2.26c.18.301.122.687-.138.921l-2.938-3.264zm11.97-9.984a.732.732 0 01-.925-.926l4.166 1.389c.954-2.861-1.768-5.583-4.63-4.63l1.39 4.167zm-19.956 2.022c-2.967.99-3.407 5.003-.726 6.611l2.26-3.766a.732.732 0 01-.145 1.322l-1.39-4.167z" fill="#fff" mask="url(#icon-payments-cat_svg__a)"></path>
                <defs>
                    <linearGradient id="icon-payments-cat_svg__paint0_linear_1141_21101" x1="25" y1="2" x2="25" y2="48" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#fff" stop-opacity="0.71"></stop>
                        <stop offset="1" stop-color="#fff" stop-opacity="0"></stop>
                    </linearGradient>
                </defs>
            </svg>
        </div>
        <span class="button__text">Denegar</span>
    </div>
</button>

</td>

                <!-- Agrega más filas según sea necesario -->
            </tbody>
        </table>

        <!-- Modal -->
        <div id="myModal" class="modal">
            <!-- Contenido del modal -->
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Detalles del Estudiante</h2>
                    <span class="close" onclick="closeModal()">&times;</span>
                </div>
                <div class="modal-body">
                    <p><strong>Código:</strong> <span id="modalCodigo"></span></p>
                    <p><strong>Nombre:</strong> <span id="modalNombre"></span></p>
                    <p><strong>Apellido:</strong> <span id="modalApellido"></span></p>
                    <p><strong>Carrera:</strong> <span id="modalCarrera"></span></p>
                    <p><strong>Opción:</strong> <span id="modalOpcion"></span></p>
                    <p><strong>Cédula:</strong> <span id="modalCedula"></span></p>
                </div>
            </div>
        </div>

        <footer>
            <p>Sistema Registro de Matricula. Todos los Derechos Reservados</p>
        </footer>
    </form>

    <script>
    // Función para filtrar la tabla
    function filterTable() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    // Función para limpiar el campo de búsqueda y aplicar animación al basurero
    function clearInput() {
        document.getElementById("myInput").value = "";
        filterTable(); // Para asegurar que la tabla se actualice al borrar el texto de búsqueda
        // Agregar clase "clicked" al basurero
        document.querySelector(".clear-input").classList.add("clicked");
        // Eliminar clase "clicked" después de un tiempo para permitir la repetición de la animación
        setTimeout(function () {
            document.querySelector(".clear-input").classList.remove("clicked");
        }, 300); // El mismo tiempo que la duración de la transición
        }

        // Variable global para controlar el estado del modal
        let modalOpen = false;

        // Función para alternar la apertura y cierre del modal
        function toggleModal(cedula, nombre, apellido, carrera, opcion_graduacion, telefono) {
            if (!modalOpen) {
                openModal(cedula, nombre, apellido, carrera, opcion_graduacion, telefono);
            } else {
                closeModal();
            }
            modalOpen = !modalOpen;
        }

        // Función para abrir el modal
        function openModal(cedula, nombre, apellido, carrera, opcion_graduacion, telefono) {
            document.getElementById("myModal").style.display = "block";
            document.getElementById("cedula").innerText = cedula;
            document.getElementById("nombre").innerText = nombre;
            document.getElementById("apellido").innerText = apellido;
            document.getElementById("carrera").innerText = carrera;
            document.getElementById("opcion_graduacion").innerText = opcion_graduacion;
            document.getElementById("telefono").innerText = telefono;
        }

        // Función para cerrar el modal
        function closeModal() {
            document.getElementById("myModal").style.display = "none";
        }


    </script>

</body>
</html>