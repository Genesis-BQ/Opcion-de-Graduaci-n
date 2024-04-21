using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpcionGraduacion
{
    public partial class Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST" && !string.IsNullOrEmpty(Request.Form["cedula"])) 
            {
                string cedula = Request.Form["cedula"];

                // Cadena de conexión a la base de datos
                string connectionString = "Data Source=tiusr3pl.cuc-carrera-ti.ac.cr\\MSSQLSERVER2019;Initial Catalog=opciongraduacion;User ID=Opc;Password=opciongraduacion;";

                // Consulta SQL para obtener los datos del usuario por cédula
                string query = @"SELECT * FROM [opciongraduacion].[opc].[Usuarios] WHERE [Identificacion] = @Identificacion";

                // Establecer la conexión y ejecutar la consulta
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Identificacion", cedula);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            // Construir un objeto JSON con los datos del usuario
                            var usuario = new
                            {
                                Identificacion = reader["Identificacion"],
                                Nombre = reader["Nombre"],
                                Apellido = reader["Apellido"],
                                FechaNacimiento = reader["FechaNacimiento"],
                                Residencia = reader["Residencia"],
                                Genero = reader["Genero"],
                                Telefono = reader["Telefono"],
                                Carrera = reader["Carrera"],
                                CorreoElectronico = reader["CorreoElectronico"],
                                Contraseña = reader["Contraseña"],
                                Rol = reader["Rol"]
                            };

                            // Convertir el objeto a JSON y enviarlo como respuesta
                            string jsonUsuario = JsonConvert.SerializeObject(usuario);
                            Response.ContentType = "application/json";
                            Response.Write(jsonUsuario);
                        }
                        else
                        {
                            // Si no se encuentra ningún usuario con la cédula proporcionada, devolver un objeto JSON vacío
                            Response.ContentType = "application/json";
                            Response.Write("{}");
                        }

                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        // Manejar cualquier excepción y devolver un objeto JSON vacío
                        Response.ContentType = "application/json";
                        Response.Write("{}");
                    }
                    finally
                    {
                        connection.Close();
                    }
                }

                // Importante: detener el procesamiento de la página después de manejar la solicitud POST
                Response.End();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                // Obtén los valores del formulario
                int identificacion = Convert.ToInt32(Request.Form["id"]);
                string nombre = Request.Form["nombre"];
                string apellido = Request.Form["apellido"];
                DateTime fechaNacimiento = Convert.ToDateTime(Request.Form["fechaNacimiento"]);
                string residencia = Request.Form["residencia"];
                string genero = Request.Form["genero"];
                int telefono = Convert.ToInt32(Request.Form["telefono"]);
                string correo = Request.Form["email"];
                string carrera = Request.Form["carrera"];
                string contraseña = Request.Form["password"];

                // Cadena de conexión a la base de datos
                string connectionString = "Data Source=tiusr3pl.cuc-carrera-ti.ac.cr\\MSSQLSERVER2019;Initial Catalog=opciongraduacion;User ID=Opc;Password=opciongraduacion;";

                // Consulta SQL para actualizar los datos del usuario
                string query = @"UPDATE [opciongraduacion].[opc].[Usuarios] 
                         SET [Nombre] = @Nombre, [Apellido] = @Apellido, [FechaNacimiento] = @FechaNacimiento,
                             [Residencia] = @Residencia, [Genero] = @Genero, [Telefono] = @Telefono,
                             [Carrera] = @Carrera, [CorreoElectronico] = @Correo, [Contraseña] = @Contrasena 
                         WHERE [Identificacion] = @Identificacion";

                // Establecer la conexión y ejecutar la consulta
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Identificacion", identificacion);
                    command.Parameters.AddWithValue("@Nombre", nombre);
                    command.Parameters.AddWithValue("@Apellido", apellido);
                    command.Parameters.AddWithValue("@FechaNacimiento", fechaNacimiento);
                    command.Parameters.AddWithValue("@Residencia", residencia);
                    command.Parameters.AddWithValue("@Genero", genero);
                    command.Parameters.AddWithValue("@Telefono", telefono);
                    command.Parameters.AddWithValue("@Carrera", carrera);
                    command.Parameters.AddWithValue("@Correo", correo);
                    command.Parameters.AddWithValue("@Contrasena", contraseña);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    connection.Close();

                    if (rowsAffected > 0)
                    {
                        labelmensaje.Text = "Sus datos se actualizaron con éxito";
                    }
                    else
                    {
                        labelmensaje.Text = "Por favor complete todos los campos antes de enviar el formulario. Hay campos vacíos que deben ser llenados";
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejar el error y mostrar el mensaje personalizado
                labelmensaje.Text = "Error al actualizar los datos";
            }
        }
    }
}