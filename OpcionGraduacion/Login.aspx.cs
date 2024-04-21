using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpcionGraduacion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            // Obtener los valores ingresados por el usuario
            string usuario = usuarios.Value.Trim();
            string contraseña = password.Value.Trim();

            // Consultar la base de datos para validar las credenciales
            string connectionString = "Data Source=tiusr3pl.cuc-carrera-ti.ac.cr\\MSSQLSERVER2019;Initial Catalog=opciongraduacion;User ID=Opc;Password=opciongraduacion;";
            string query = "SELECT Rol FROM [opciongraduacion].[opc].[Usuarios] WHERE Identificacion = @Identificacion AND Contraseña = @Contraseña";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Identificacion", usuario);
                command.Parameters.AddWithValue("@Contraseña", contraseña);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        string rol = reader["Rol"].ToString();

                        if (rol.Equals("estudiante", StringComparison.OrdinalIgnoreCase) || rol.Equals("administración", StringComparison.OrdinalIgnoreCase))
                        {
                            // Redirigir al usuario a la página Principal.aspx
                            Response.Redirect("Principal.aspx");
                        }
                        else
                        {
                            // El usuario no es estudiante ni administración, mostrar un mensaje de error
                            labelmensaje.Text = "Lo sentimos, solo los estudiantes y el personal de administración pueden acceder a esta página.";
                        }
                    }
                    else
                    {
                        // Las credenciales no son válidas, mostrar un mensaje de error
                        labelmensaje.Text = "Usuario o contraseña incorrectos. Por favor, inténtelo de nuevo.";
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Manejar cualquier excepción y mostrar un mensaje de error genérico
                    labelmensaje.Text = "Lo sentimos, se ha producido un error interno en el servidor al procesar su solicitud. Por favor, inténtelo de nuevo más tarde. Si el problema persiste, póngase en contacto con el equipo de soporte técnico para obtener ayuda adicional.";
                }
                finally
                {
                    connection.Close();
                }
            }
        }

    }
}