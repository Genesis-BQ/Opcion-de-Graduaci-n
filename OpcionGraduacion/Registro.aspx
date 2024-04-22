<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="OpcionGraduacion.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro de Usuario</title>
    <link rel="stylesheet" href="./CSS/Registro.css" />
</head>
<body>
    <header class="header">
      
         <a href="Login.aspx">
                <img src="./img/download-removebg-preview (1).png" />
            </a>
        <h1 class="title">Registro de Usuario</h1>
    </header>
    <div class="container">

        <div class="form-container">
            <form id="Form1" runat="server">
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
