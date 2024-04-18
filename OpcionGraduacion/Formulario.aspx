<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="OpcionGraduacion.Formulario" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Opción de Graduación</title>
    <link href="CSS/formulario.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1>Registro de Opción de Graduación</h1>
        <form id="formRegistro" runat="server">
            <label for="email">Correo electrónico:</label>
            <asp:TextBox ID="email" runat="server" TextMode="Email" ></asp:TextBox><br>

            <label for="identificacion">Identificación:</label>
            <asp:TextBox ID="identificacion" runat="server" ></asp:TextBox><br>

            <label for="nombre">Nombre:</label>
            <asp:TextBox ID="nombre" runat="server" ></asp:TextBox><br>

            <label for="apellidos">Apellidos:</label>
            <asp:TextBox ID="apellidos" runat="server" ></asp:TextBox><br>

            <label for="carrera">Carrera:</label>
            <asp:DropDownList ID="ddlCarreras" runat="server">
                <asp:ListItem Text="Seleccione una carrera" Value="" />
            </asp:DropDownList><br>

            <label for="cursos_completos">Cursos Completos:</label>
            <asp:CheckBox ID="cursos_completos" runat="server" /><br>

            <label for="opcion_graduacion">Opción de Graduación:</label>
            <asp:DropDownList ID="ddlOpcionesGraduacion" runat="server">
                <asp:ListItem Text="Seleccione una opción" Value="" />
            </asp:DropDownList><br>

            <asp:Button ID="btnRegistrar" runat="server" Text="Registrarse" OnClick="btnRegistrar_Click" />
            <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
        </form>
    </div>
</body>
</html>

