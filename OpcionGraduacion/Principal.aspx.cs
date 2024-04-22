using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpcionGraduacion
{
    public partial class Principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

        protected void BtnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }

    }
}
