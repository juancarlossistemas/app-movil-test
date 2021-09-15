using Api.Test.Entidad;
using Api.Test.Util;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.Test.Datos
{
    public class TG_USUARIO_DATOS
    {
        public bool GuardarUsuario(TG_USUARIO _E, SqlConnection cn)
        {
            bool seGuardo = false;
            try
            {
                using (SqlCommand sqlCmd = new SqlCommand("PROC_TG_USUARIO_INSERTAR", cn))
                {
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add(new SqlParameter("@USUARI_T_CORREO", _E.USUARI_T_CORREO));
                    sqlCmd.Parameters.Add(new SqlParameter("@USUARI_T_NOMBRE", _E.USUARI_T_NOMBRE));
                    sqlCmd.Parameters.Add(new SqlParameter("@USUARI_T_CONTRA", _E.USUARI_T_CONTRA));
                    sqlCmd.Parameters.Add(new SqlParameter("@GENERO_N_CODIGO", _E.GENERO_N_CODIGO));
                    sqlCmd.Parameters.Add(new SqlParameter("@USUARI_T_FECNAC", _E.USUARI_T_FECNAC));

                    SqlParameter paramOut = new SqlParameter();
                    paramOut.Direction = System.Data.ParameterDirection.Output;
                    paramOut.DbType = System.Data.DbType.Int32;
                    paramOut.ParameterName = "@PAROUT_T_FILAFE"; //FILAS AFECTADAS
                    sqlCmd.Parameters.Add(paramOut);

                    sqlCmd.ExecuteNonQuery();
                    seGuardo = int.Parse(paramOut.Value.ToString()) > 0;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return seGuardo;
        }
    }
}
