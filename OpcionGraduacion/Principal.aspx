<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="OpcionGraduacion.Principal" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registro opción de graduación</title>
    <link rel="stylesheet" href="./CSS/style.css" />
    <link rel="icon" type="image/png" href="./img/download-removebg-preview (1).png" />
</head>
<body>
    <form id="form1" runat="server">
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
              
        <main>
            <div class="options-container">
                <section class="edu">
                    <a href="formulario.aspx" class="option">
                        <img src="/img/opGrad.png" alt="Automatrícula Icon" />
                        <p>Registro de opción de Graduación</p>
                    </a>
                     <a href="Perfil.aspx" class="option">
                        <img src="/img/perfil.png" alt="Automatrícula Icon" />
                        <p>Mi Perfil</p>
                    </a>
                </section>
            </div>
        </main>

        <footer>
        <p>Sistema Registro de opcion de graduación. Todos los Derechos Reservados</p>
        </footer>
    </form>
</body>
</html>