﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="OpcionGraduacion.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro de Usuario</title>
    <link rel="stylesheet" href="./CSS/Registro.css" />
</head>
<body>
    <header class="header">
      
        <img class="logo" src="./img/LogoCuc-removebg-preview.png" alt="Logo" />
        <h1 class="title">Registro de Usuario</h1>
    </header>
    <div class="container">

        <div class="form-container">
            <form id="Form1" runat="server">
                <div class="input-group">
                    <label for="id">Identificación:</label>
                    <input type="text" id="id" name="id" required>
                </div>
                <div class="input-group">
                    <label for="email">Correo electrónico:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="input-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" required>
                </div>
                <div class="input-group">
                    <label for="apellidos">Apellidos:</label>
                    <input type="text" id="apellidos" name="apellidos" required>
                </div>
                <div class="input-group">
                    <label for="carrera">Carrera:</label>
                    <select id="carrera" name="carrera" required>
                        <option value="ingenieria">Ingeniería</option>
                        <option value="medicina">Medicina</option>
                    </select>
                </div>
                <div class="input-group">
                    <label for="residencia">Lugar de residencia:</label>
                    <input type="text" id="residencia" name="residencia" required>
                </div>
                <div class="input-group">
                    <label for="genero">Género:</label>
                    <select id="genero" name="genero" required>
                        <option value="femenino">Femenino</option>
                        <option value="masculino">Masculino</option>
                    </select>
                </div>
                <div class="input-group">
                    <label for="fechaNacimiento">Fecha de nacimiento:</label>
                    <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>
                </div>
                <div class="input-group">
                    <label for="telefono">Número de teléfono:</label>
                    <input type="tel" id="telefono" name="telefono" required>
                </div>
                <div class="input-group">
                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="input-group">
                    <button type="submit" class="submit-btn">Registrar</button>
                </div>
            </form>
        </div>

    </div>
    <footer class="footer">
        <p>Sistema Registro de opcion de graduación. Todos los Derechos Reservados</p>
    </footer>
</body>

</html>
