<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="OpcionGraduacion.Perfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Perfil de Usuario</title>
     <%--<link rel="stylesheet" href="./CSS/style.css" />--%>
     <link rel="stylesheet" href="./CSS/PerfilUsuario.css" />
     <link rel="icon" type="image/png" href="./img/download-removebg-preview (1).png" />
</head>
<body>
    <form id="form1" runat="server">
         <header>
            <a href="Principal.aspx">
                <img src="./img/download-removebg-preview (1).png" />
            </a>
            <h1 style="color: white;">Perfil de Usuario</h1>
             <asp:LinkButton ID="BtnCerrarSesion" runat="server" CssClass="Btn" >
                <div class="sign">
                    <svg viewBox="0 0 512 512">
                        <path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"></path>
                    </svg>
                </div>
                <div class="text">Cerrar Sesión</div>
            </asp:LinkButton>
        </header>
        <main>
            <div class="formulario-container">
                <div class="Formulario">
                    <form id="profile-form">
                        <div class="form-group">
                            <h1>Mi Perfil</h1>
                            <label for="nombre">Nombre:</label>
                            <input type="text" id="nombre" name="nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="apellidos">Apellidos:</label>
                            <input type="text" id="apellidos" name="apellidos" required>
                        </div>
                        <div class="form-group">
                            <label for="residencia">Lugar de Residencia:</label>
                            <input type="text" id="residencia" name="residencia">
                        </div>
                        <div class="form-group">
                            <label for="genero">Género:</label>
                            <select id="genero" name="genero">
                                <option value="masculino">Masculino</option>
                                <option value="femenino">Femenino</option>
                                <option value="otro">Otro</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Número de Teléfono:</label>
                            <input type="tel" id="telefono" name="telefono">
                        </div>
                        <div class="form-group">
                            <label for="contrasena">Contraseña:</label>
                            <input type="password" id="contrasena" name="contrasena" required>
                        </div>
                        <button>
  <div class="svg-wrapper-1">
    <div class="svg-wrapper">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 24 24"
        width="24"
        height="24"
      >
        <path fill="none" d="M0 0h24v24H0z"></path>
        <path
          fill="currentColor"
          d="M1.946 9.315c-.522-.174-.527-.455.01-.634l19.087-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.455.547-.679.045L12 14l6-8-8 6-8.054-2.685z"
        ></path>
      </svg>
    </div>
  </div>
  <span>Guardar</span>
</button>
                    </form>
                </div>
            </div>
        </main>

        <footer>
            <p>Sistema Registro de Matricula. Todos los Derechos Reservados</p>
        </footer>
    </form>
     <div id="message"></div>
</body>
</html>
