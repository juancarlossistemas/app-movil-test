using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.Test.Logica
{
    public class TG_BASE
    {
        static string nameConnection = ConfigurationManager.AppSettings["NombreConexion"];
        static string cadenaConexion = ConfigurationManager.ConnectionStrings[nameConnection].ConnectionString;

        protected SqlConnection cn = new SqlConnection(cadenaConexion);
    }
}
