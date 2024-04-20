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
        //    if (!IsPostBack)
        //    {
        //        CargarDatos();
        //    }
        }

        //private void CargarDatos()
        //{
        //    //string connectionString = ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString;
        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        using (SqlCommand command = new SqlCommand("ObtenerDatosCarrerasOpcionesGraduacion", connection))
        //        {
        //            command.CommandType = CommandType.StoredProcedure;
        //            connection.Open();
        //            SqlDataReader reader = command.ExecuteReader();
        //            while (reader.Read())
        //            {
        //                string tipo = reader["Tipo"].ToString();
        //                int id = Convert.ToInt32(reader["ID"]);
        //                string nombre = reader["Nombre"].ToString();
        //                string detalle = reader["Detalle"].ToString();

        //                if (tipo == "Carrera")
        //                {
        //                    ddlCarreras.Items.Add(new ListItem(nombre + " - " + detalle, id.ToString()));
        //                }
        //                else if (tipo == "Opción de Graduación")
        //                {
        //                    ddlOpcionesGraduacion.Items.Add(new ListItem(nombre + " - Carrera: " + detalle, id.ToString()));
        //                }
        //            }
        //            reader.Close();
        //        }
        //    }
        //}

        //protected void btnRegistrar_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string correoElectronico = email.Text;
        //        int identificacionEstudiante;
        //        if (!int.TryParse(identificacion.Text, out identificacionEstudiante))
        //        {
        //            lblMensaje.Text = "La identificación del estudiante debe ser un número entero válido.";
        //            return;
        //        }
        //        string nombreEstudiante = nombre.Text;
        //        string apellidoEstudiante = apellidos.Text;
        //        int carreraID = Convert.ToInt32(ddlCarreras.SelectedValue);
        //        bool cursosCompletos = cursos_completos.Checked;
        //        int opcionGraduacionID = Convert.ToInt32(ddlOpcionesGraduacion.SelectedValue);

        //        InsertarFormulario(correoElectronico, identificacionEstudiante, nombreEstudiante, apellidoEstudiante, carreraID, cursosCompletos, opcionGraduacionID);

        //        Response.Redirect("Confirmacion.aspx");
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMensaje.Text = "Error al registrar el formulario: " + ex.Message;
        //    }
        //}

        //private void InsertarFormulario(string correoElectronico, int identificacionEstudiante, string nombre, string apellido, int carreraID, bool cursosCompletos, int opcionGraduacionID)
        //{
        //    using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString))
        //    {
        //        using (SqlCommand command = new SqlCommand("InsertarFormulario", connection))
        //        {
        //            command.CommandType = CommandType.StoredProcedure;
        //            command.Parameters.AddWithValue("@CorreoElectronico", correoElectronico);
        //            command.Parameters.AddWithValue("@Identificacion", identificacionEstudiante);
        //            command.Parameters.AddWithValue("@Nombre", nombre);
        //            command.Parameters.AddWithValue("@Apellido", apellido);
        //            command.Parameters.AddWithValue("@CarreraID", carreraID);
        //            command.Parameters.AddWithValue("@CursosCompletos", cursosCompletos);
        //            command.Parameters.AddWithValue("@OpcionGraduacionID", opcionGraduacionID);

        //            connection.Open();
        //            command.ExecuteNonQuery();
        //        }
        //    }
        //}

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            
        }
    }
}