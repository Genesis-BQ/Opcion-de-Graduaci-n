<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="OpcionGraduacion.Perfil" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro opción de graduación</title>
    <link rel="stylesheet" href="./CSS/Registro.css" />
         <link rel="stylesheet" href="./CSS/style.css" />

</head>
<body>
                <form id="Form1" runat="server">

                <header>
    <a href="Principal.aspx">
        <img src="./img/download-removebg-preview (1).png" />
    </a>
        <asp:Label class="Nombre" ID="lblNombre" runat="server" style="color: white; font-size: 40px;"></asp:Label>

<div class="user-info">
    <asp:LinkButton ID="BtnCerrarSesion" runat="server" CssClass="Btn" OnClick="BtnCerrarSesion_Click">
        <div class="sign">
            <svg viewBox="0 0 512 512">
                <path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path>
            </svg>
        </div>
        <div class="text">Cerrar Sesión</div>
    </asp:LinkButton>
</div>


</header>
    <div class="container">

        <div class="form-container">

                <div class="input-group">
                    <label for="id">Identificación:</label>
                    <input type="text" id="id" name="id"  onblur="buscarUsuarioPorCedula()" required/>
                </div>

                <div class="input-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" required/>
                </div>
                <div class="input-group">
                    <label for="apellido">Apellidos:</label>
                    <input type="text" id="apellido" name="apellido" required />
                </div>

                <div class="input-group">
                    <label for="fechaNacimiento">Fecha de nacimiento:</label>
                    <input type="date" id="fechaNacimiento" name="fechaNacimiento" required/>
                </div>

                <div class="input-group">
                    <label for="residencia">Lugar de residencia:</label>
                    <input type="text" id="residencia" name="residencia" required/>
                </div>
                <div class="input-group">
                    <label for="genero">Género:</label>
                    <select id="genero" name="genero" required/>
                        <option value="femenino">Femenino</option>
                        <option value="masculino">Masculino</option>
                    </select>
                </div>

                <div class="input-group">
                    <label for="telefono">Número de teléfono:</label>
                    <input type="tel" id="telefono" name="telefono" required/>
                </div>
                <div class="input-group">
                    <label for="email">Correo electrónico:</label>
                    <input type="email" id="email" name="email" required/>
                </div>

                <div class="input-group">
                    <label for="carrera">Carrera:</label>
                    <select id="carrera" name="carrera" required>
                        <option value="Administracion de Empresas">Administracion de Empresas</option>
                        <option value="Electrónica">Electrónica</option>
                        <option value="Investigación Criminal">Investigación Criminal</option>
                         <option value="Mecánica Dental">Mecánica Dental</option>
                         <option value="Secretario Ejecutivo">Secretario Ejecutivo</option>
                         <option value="Ingeniería Informática">Ingeniería Informática</option>
                         <option value="Turismo">Turismo</option>
                        <option value="Big Data">Big Data</option>
                        <option value="Géstion Calidad">Géstion Calidad</option>
                    </select>
                </div>
             
                <div class="input-group">
                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required/>
                </div>
                <div class="input-group">
                     <asp:Button ID="btnGuardar" class="submit-btn" runat="server" OnClick="btnGuardar_Click" Text="Registrar" />
                    
                </div>
                <asp:Label ID="labelmensaje" runat="server"></asp:Label>
            </form>
        </div>

    </div>
    <footer class="footer">
        <p>Sistema Registro de opcion de graduación. Todos los Derechos Reservados</p>
    </footer>
    <script>
        function buscarUsuarioPorCedula() {
            var cedula = document.getElementById("id").value;
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "Registro.aspx", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var usuario = JSON.parse(xhr.responseText);
                    // Verifica si el usuario es válido
                    if (usuario && usuario.Identificacion) {
                        // Actualiza los campos del formulario con los datos del usuario
                        document.getElementById("nombre").value = usuario.Nombre;
                        document.getElementById("apellido").value = usuario.Apellido;
                        document.getElementById("fechaNacimiento").value = usuario.FechaNacimiento;
                        document.getElementById("residencia").value = usuario.Residencia;
                        document.getElementById("genero").value = usuario.Genero;
                        document.getElementById("telefono").value = usuario.Telefono;
                        document.getElementById("email").value = usuario.CorreoElectronico;
                        document.getElementById("carrera").value = usuario.Carrera;
                        document.getElementById("password").value = usuario.Contraseña;
                    } else {
                        // Muestra el mensaje de error en el label
                        document.getElementById("labelmensaje").innerText = "Error de validación: Se han encontrado problemas con los datos ingresados.";
                    }
                }
            };
            xhr.send("cedula=" + encodeURIComponent(cedula));
        }
    </script>


</body>

</html>

