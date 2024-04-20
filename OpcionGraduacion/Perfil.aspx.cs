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

        }
        protected void btnCargar_Click(object sender, EventArgs e)
        {
            string identificacion = Identificacion.Value.Trim();

            string connectionString = "Data Source=tiusr3pl.cuc-carrera-ti.ac.cr\\MSSQLSERVER2019;Initial Catalog=opciongraduacion;User ID=Opc;Password=opciongraduacion;";


            string query = "SELECT [Nombre], [Apellido], [FechaNacimiento], [Residencia], [Genero], [Telefono], [Carrera], [CorreoElectronico], [Contraseña] FROM [opciongraduacion].[opc].[Usuarios] WHERE [Identificacion] = @Identificacion";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Identificacion", identificacion);

                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    // Llenar los campos del formulario con los datos obtenidos de la base de datos
                    nombre.Value = reader["Nombre"].ToString();
                    apellidos.Value = reader["Apellido"].ToString();
                    fechanacimiento.Value = reader["FechaNacimiento"].ToString();
                    residencia.Value = reader["Residencia"].ToString();
                    genero.Value = reader["Genero"].ToString();
                    telefono.Value = reader["Telefono"].ToString();
                    carrera.Value = reader["Carrera"].ToString();
                    correo.Value = reader["CorreoElectronico"].ToString();
                    contrasena.Value = reader["Contraseña"].ToString();
                }

                Identificacion.Disabled = true;
                fechanacimiento.Disabled = true;

                reader.Close();
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // Obtener los valores modificados de los campos del formulario
            string identificacion = Identificacion.Value.Trim();
            string nombreNuevo = nombre.Value.Trim();
            string apellidosNuevos = apellidos.Value.Trim();
            string residenciaNueva = residencia.Value.Trim();
            string generoNuevo = genero.Value.Trim();
            string telefonoNuevo = telefono.Value.Trim();
            string carreraNueva = carrera.Value.Trim();
            string correoNuevo = correo.Value.Trim();
            string contrasenaNueva = contrasena.Value.Trim();

            // Cadena de conexión a la base de datos
            string connectionString = "Data Source=tiusr3pl.cuc-carrera-ti.ac.cr\\MSSQLSERVER2019;Initial Catalog=opciongraduacion;User ID=Opc;Password=opciongraduacion;";

            // Consulta SQL para actualizar los datos del usuario
            string query = @"UPDATE [opciongraduacion].[opc].[Usuarios] 
                     SET [Nombre] = @Nombre, [Apellido] = @Apellido, [Residencia] = @Residencia, [Genero] = @Genero, 
                         [Telefono] = @Telefono, [Carrera] = @Carrera, [CorreoElectronico] = @Correo, [Contraseña] = @Contrasena 
                     WHERE [Identificacion] = @Identificacion";

            // Establecer la conexión y ejecutar la consulta
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Nombre", nombreNuevo);
                command.Parameters.AddWithValue("@Apellido", apellidosNuevos);
                command.Parameters.AddWithValue("@Residencia", residenciaNueva);
                command.Parameters.AddWithValue("@Genero", generoNuevo);
                command.Parameters.AddWithValue("@Telefono", telefonoNuevo);
                command.Parameters.AddWithValue("@Carrera", carreraNueva);
                command.Parameters.AddWithValue("@Correo", correoNuevo);
                command.Parameters.AddWithValue("@Contrasena", contrasenaNueva);
                command.Parameters.AddWithValue("@Identificacion", identificacion);

                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();
                connection.Close();

                if (rowsAffected > 0)
                {
                    labelmensaje.Text = "Sus datos se actualizaron con éxito";
                }
                else
                {
                    labelmensaje.Text = "Error al actualizar los datos";
                }
            }
        }
    }
}