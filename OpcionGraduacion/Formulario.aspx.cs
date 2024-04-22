using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpcionGraduacion
{
    public partial class Formulario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                CargarDatos();

                if (Session["UserName"] != null)
                {
                    string identificacion = Session["UserName"].ToString();
                    string nombre = ObtenerNombrePorIdentificacion(identificacion);
                    lblNombre.Text = nombre;
                }
                else
                {

                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void CargarDatos()
        {
            string connectionString = "Data Source=tiusr3pl.cuc-carrera-ti.ac.cr\\MSSQLSERVER2019;Initial Catalog=opciongraduacion;User ID=Opc;Password=opciongraduacion;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("ObtenerDatosCarrerasOpcionesGraduacion", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        string tipo = reader["Tipo"].ToString();
                        int id = Convert.ToInt32(reader["ID"]);
                        string nombre = reader["Nombre"].ToString();
                        string detalle = reader["Detalle"].ToString();

                        if (tipo == "Carrera")
                        {
                            ddlCarreras.Items.Add(new ListItem(nombre + " - " + detalle, id.ToString()));
                        }
                        else if (tipo == "Opción de Graduación")
                        {
                            ddlOpcionesGraduacion.Items.Add(new ListItem(nombre + " - Carrera: " + detalle, id.ToString()));
                        }
                    }
                    reader.Close();
                }
            }
        }

        private string ObtenerNombrePorIdentificacion(string identificacion)
        {
            string nombreCompleto = string.Empty;
            string connectionString = "Data Source=tiusr3pl.cuc-carrera-ti.ac.cr\\MSSQLSERVER2019;Initial Catalog=opciongraduacion;User ID=Opc;Password=opciongraduacion;";
            string query = "SELECT Nombre, Apellido FROM [opciongraduacion].[opc].[Usuarios] WHERE Identificacion = @Identificacion";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Identificacion", identificacion);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        string nombre = reader["Nombre"].ToString();
                        string apellido = reader["Apellido"].ToString();
                        nombreCompleto = nombre + " " + apellido;
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {

                }
            }

            return nombreCompleto;
        }
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                // Verificar si hay campos vacíos
                if (string.IsNullOrEmpty(identificacion.Text) || string.IsNullOrEmpty(nombre.Text) || string.IsNullOrEmpty(apellidos.Text) || string.IsNullOrEmpty(email.Text) || ddlCarreras.SelectedIndex == 0 || ddlOpcionesGraduacion.SelectedIndex == 0)
                {
                    // Mostrar mensaje de error al usuario
                    lblMensaje.Text = "Por favor complete todos los campos obligatorios antes de enviar el formulario. Hay campos vacíos que deben ser llenados.";
                    return;
                }

                // Verificar si el estudiante está matriculado en la universidad
                bool estudianteMatriculado = VerificarEstudianteMatriculado(identificacion.Text);
                if (!estudianteMatriculado)
                {
                    // Mostrar mensaje de error al usuario
                    lblMensaje.Text = "El estudiante no está matriculado en esta universidad.";
                    return;
                }

                // Verificar si el correo electrónico ya tiene un formulario registrado
                bool formularioExistente = VerificarFormularioExistente(identificacion.Text);
                if (formularioExistente)
                {
                    // Mostrar mensaje de error al usuario
                    lblMensaje.Text = "El estudiante ya llenó un formulario.";
                    return;
                }

                // Si no hay campos vacíos ni correos duplicados y el estudiante está matriculado, proceder con la inserción
                string connectionString = "Data Source=tiusr3pl.cuc-carrera-ti.ac.cr\\MSSQLSERVER2019;Initial Catalog=opciongraduacion;User ID=Opc;Password=opciongraduacion;";

                string query = "INSERT INTO [opc].[Formularios] (Identificacion, Nombre, Apellido, CorreoElectronico, CarreraID, CursosCompletos, OpcionGraduacionID, Estado) " +
                               "VALUES (@Identificacion, @Nombre, @Apellido, @CorreoElectronico, @CarreraID, @CursosCompletos, @OpcionGraduacionID, 'Pendiente')";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Agregar parámetros
                        command.Parameters.AddWithValue("@Identificacion", identificacion.Text);
                        command.Parameters.AddWithValue("@Nombre", nombre.Text);
                        command.Parameters.AddWithValue("@Apellido", apellidos.Text);
                        command.Parameters.AddWithValue("@CorreoElectronico", email.Text);
                        command.Parameters.AddWithValue("@CarreraID", ddlCarreras.SelectedValue);
                        command.Parameters.AddWithValue("@CursosCompletos", cursos_completos.Checked ? 1 : 0);
                        command.Parameters.AddWithValue("@OpcionGraduacionID", ddlOpcionesGraduacion.SelectedValue);

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        connection.Close();

                        if (rowsAffected > 0)
                        {
                            // Inserción exitosa, mostrar mensaje de éxito al usuario
                            lblMensaje.Text = "Su registro se validó con éxito. Ver el formulario de informes";
                        }
                        else
                        {
                            // Error durante la inserción, mostrar mensaje de error al usuario
                            lblMensaje.Text = "Error durante el registro. Por favor, inténtelo de nuevo.";
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                lblMensaje.Text = "Error al cargar los datos";
            }
        }



        private bool VerificarFormularioExistente(string identificacion)
        {
            // Variable para almacenar el resultado de la verificación
            bool estudianteRegistrado = false;

            // Cadena de conexión a la base de datos
            string connectionString = "Data Source=tiusr3pl.cuc-carrera-ti.ac.cr\\MSSQLSERVER2019;Initial Catalog=opciongraduacion;User ID=Opc;Password=opciongraduacion;";

            // Consulta SQL para verificar si el estudiante está registrado
            string query = "SELECT COUNT(*) FROM Formularios WHERE Identificacion = @Identificacion";

            // Crear la conexión a la base de datos y el comando SQL
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Agregar parámetro para la identificación del estudiante
                    command.Parameters.AddWithValue("@Identificacion", identificacion);

                    // Abrir la conexión
                    connection.Open();

                    // Ejecutar la consulta y obtener el resultado
                    int count = (int)command.ExecuteScalar();

                    // Si el resultado es mayor que cero, significa que el estudiante está registrado
                    if (count > 0)
                    {
                        estudianteRegistrado = true;
                    }

                    // Cerrar la conexión
                    connection.Close();
                }
            }

            // Retornar el resultado de la verificación
            return estudianteRegistrado;
        }

        private bool VerificarEstudianteMatriculado(string identificacion)
        {
            // Variable para almacenar el resultado de la verificación
            bool estudianteMatriculado = false;

            // Cadena de conexión a la base de datos
            string connectionString = "Data Source=tiusr3pl.cuc-carrera-ti.ac.cr\\MSSQLSERVER2019;Initial Catalog=opciongraduacion;User ID=Opc;Password=opciongraduacion;";

            // Consulta SQL para verificar si el estudiante está matriculado
            string query = "SELECT COUNT(*) FROM Estudiantes WHERE Identificacion = @Identificacion";

            // Crear la conexión a la base de datos y el comando SQL
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Agregar parámetro para la identificación del estudiante
                    command.Parameters.AddWithValue("@Identificacion", identificacion);

                    // Abrir la conexión
                    connection.Open();

                    // Ejecutar la consulta y obtener el resultado
                    int count = (int)command.ExecuteScalar();

                    // Si el resultado es mayor que cero, significa que el estudiante está matriculado en la tabla Estudiantes
                    if (count > 0)
                    {
                        estudianteMatriculado = true;
                    }

                    // Cerrar la conexión
                    connection.Close();
                }
            }

            // Retornar el resultado de la verificación
            return estudianteMatriculado;
        }

        protected void BtnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }


    }
}