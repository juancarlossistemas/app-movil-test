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
    public class TG_TEST_DATOS
    {
        public List<TG_TEST> ListarTest(TG_TEST _e, SqlConnection cn)
        {
            List<TG_TEST> _lista = new List<TG_TEST>();

            try
            {
                using (SqlCommand sqlCmd = new SqlCommand("PROC_TG_TEST_LISTAR", cn))
                {
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;

                    using (SqlDataReader reader = sqlCmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                TG_TEST _el = new TG_TEST()
                                {
                                    TEST_N_CODIGO = Convert.ToInt32(reader["TEST_N_CODIGO"]),
                                    TEST_T_DESCRI = Convert.ToString(reader["TEST_T_DESCRI"]).Trim(),
                                    SITUAC_N_CODIGO = Convert.ToInt32(reader["SITUAC_N_CODIGO"]),
                                    SITUAC_T_DESCRI = Convert.ToString(reader["SITUAC_T_DESCRI"]).Trim(),
                                    SECCIO_N_CODIGO = Convert.ToInt32(reader["SECCIO_N_CODIGO"]),
                                    SECCIO_T_DESCRI = Convert.ToString(reader["SECCIO_T_DESCRI"]),
                                    RESPUE_N_CODIGO = Convert.ToInt32(reader["RESPUE_N_CODIGO"]),
                                    RESPUE_T_DESCRI = Convert.ToString(reader["RESPUE_T_DESCRI"]),
                                    SITRES_N_CODIGO = Convert.ToInt32(reader["SITRES_N_CODIGO"]),
                                };
                                _lista.Add(_el);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex);
            }

            return _lista;
        }
    }
}
