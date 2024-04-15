<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OpcionGraduacion.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="./CSS/Login.css" />
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
         <header>
            <img src="./img/download-removebg-preview (1).png" />
            <h1 style="color: white;">Login</h1>
        </header>
       <div class="Contenedorlogin">
            <div class="FormularioLogin">
                <div class="login wrap">
                    <input placeholder="Usuario" id="usuario" name="usuario" type="text"/>
                    <input placeholder="Contraseña" id="contraseña" name="contraseña" type="password"/>
                    <input value="Login" class="btn" type="submit"/>
                    <button class="icon-btn" id="olvidar-contraseña">
                        <i class="fas fa-lock"></i> Olvidé la contraseña
                    </button>
                    <button class="icon-btn" id="activar-cuenta">
                        <i class="fas fa-user"></i> Activar cuenta
                    </button>
                </div>
            </div>
        </div>
         <footer>
            <p>Sistema Registro de Matricula. Todos los Derechos Reservados</p>
        </footer>
    </form>
    <script>
        document.getElementById("activar-cuenta").addEventListener("click", function () {
            window.location.href = "Registro.aspx";
        });
    </script>

</body>
</html>
