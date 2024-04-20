<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OpcionGraduacion.Login" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro de Usuario</title>
    <link rel="stylesheet" href="./CSS/Login.css" />
</head>
<body>
    <div class="container">
        <header class="header">
           <p class="p">Inicio sesion</p>
        </header>
         <img class="logo" src="./img/LogoCuc-removebg-preview.png" alt="Logo" />
        <div class="form-container">
            <form id="Form1" runat="server" class="login-form">
                <div class="input-group">
                    <label for="usuario">Usuario</label>
                    <input type="text" id="usuario" name="usuario" required>
                </div>
                <div class="input-group">
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <input type="submit" value="Ingresar" class="submit-btn">
                <div class="login-links">
                    <a href="Registro">Registrarse</a>
                    
                </div>
            </form>
        </div>
        <footer class="footer">
            <p>Sistema Registro de opción de graduación. Todos los Derechos Reservados</p>
        </footer>
    </div>
</body>
</html>