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
    public class TG_LOGIN_DATOS
    {
        public TG_USUARIO Login(TG_USUARIO _e, SqlConnection cn)
        {
            TG_USUARIO _el = null;

            try
            {
                using (SqlCommand sqlCmd = new SqlCommand("PROC_TG_USUARIO_LOGIN", cn))
                {
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add(new SqlParameter("@USUARI_T_CORREO", _e.USUARI_T_CORREO));
                    //sqlCmd.Parameters.Add(new SqlParameter("@USUARI_T_CONTRA", _e.USUARI_T_CONTRA));

                    using (SqlDataReader reader = sqlCmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            if (reader.Read())
                            {
                                _el = new TG_USUARIO()
                                {
                                    USUARI_N_CODIGO = Convert.ToInt32(reader["USUARI_N_CODIGO"]),
                                    USUARI_T_NOMBRE = Convert.ToString(reader["USUARI_T_NOMBRE"]).Trim(),
                                    USUARI_T_CORREO = Convert.ToString(reader["USUARI_T_CORREO"]).Trim(),
                                    USUARI_T_CONTRA = Convert.ToString(reader["USUARI_T_CONTRA"]).Trim(),
                                    GENERO_N_CODIGO = Convert.ToInt32(reader["GENERO_N_CODIGO"]),
                                    USUARI_N_TESTRE = Convert.ToInt32(reader["USUARI_N_TESTRE"]),
                                };
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return _el;
        }
    }
}
