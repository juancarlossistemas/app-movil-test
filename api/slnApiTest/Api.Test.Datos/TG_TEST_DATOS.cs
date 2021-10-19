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
                    sqlCmd.Parameters.Add(new SqlParameter("@TEST_N_CODIGO", _e.TEST_N_CODIGO));

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

        public bool GuardarPuntajeTest(TG_SITUACION_RESPUESTA_PUNTAJE _E, SqlConnection cn)
        {
            bool seGuardo = false;
            try
            {
                using (SqlCommand sqlCmd = new SqlCommand("PROC_TG_SITUACION_RESPUESTA_PUNTAJE_INSERTAR", cn))
                {
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add(new SqlParameter("@TEST_N_CODIGO", _E.TEST_N_CODIGO));
                    sqlCmd.Parameters.Add(new SqlParameter("@USUARI_N_CODIGO", _E.USUARI_N_CODIGO));
                    sqlCmd.Parameters.Add(new SqlParameter("@SITRES_N_CODIGO", _E.SITRES_N_CODIGO));
                    sqlCmd.Parameters.Add(new SqlParameter("@SIREPU_D_PUNTAJ", _E.SIREPU_D_PUNTAJ));

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

        public TG_DIAGNOSTICO Diagnosticar(TG_DIAGNOSTICO _E, SqlConnection cn)
        {
            TG_DIAGNOSTICO _edl = null;
            try
            {
                using (SqlCommand sqlCmd = new SqlCommand("PROC_TG_DIAGNOSTICAR", cn))
                {
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add(new SqlParameter("@USUARI_N_CODIGO", _E.USUARI_N_CODIGO));
                    sqlCmd.Parameters.Add(new SqlParameter("@TEST_N_CODIGO", _E.TEST_N_CODIGO));

                    using (SqlDataReader reader = sqlCmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            if (reader.Read())
                            {
                                _edl = new TG_DIAGNOSTICO()
                                {
                                    DIAGNO_N_COGPUN = Convert.ToDecimal(reader["DIAGNO_N_COGPUN"]),
                                    DIAGNO_N_FISPUN = Convert.ToDecimal(reader["DIAGNO_N_FISPUN"]),
                                    DIAGNO_N_CONPUN = Convert.ToDecimal(reader["DIAGNO_N_CONPUN"]),
                                    DIAGNO_N_TOTPUN = Convert.ToDecimal(reader["DIAGNO_N_TOTPUN"]),
                                    PUNCOG_T_DESCRI = Convert.ToString(reader["PUNCOG_T_DESCRI"]).Trim(),
                                    PUNFIS_T_DESCRI = Convert.ToString(reader["PUNFIS_T_DESCRI"]).Trim(),
                                    PUNCON_T_DESCRI = Convert.ToString(reader["PUNCON_T_DESCRI"]).Trim(),
                                    PUNDIR_T_DESCRI = Convert.ToString(reader["PUNDIR_T_DESCRI"]).Trim(),
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

            return _edl;
        }

        public List<TG_TRATAMIENTO> ListarTratamiento(TG_USUARIO _e, SqlConnection cn)
        {
            List<TG_TRATAMIENTO> _lista = new List<TG_TRATAMIENTO>();

            try
            {
                using (SqlCommand sqlCmd = new SqlCommand("PROC_TG_TRATAMIENTO_LISTAR", cn))
                {
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add(new SqlParameter("@USUARI_N_CODIGO", _e.USUARI_N_CODIGO));

                    using (SqlDataReader reader = sqlCmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                TG_TRATAMIENTO _el = new TG_TRATAMIENTO()
                                {
                                    TRATAM_N_CODIGO = Convert.ToInt32(reader["TRATAM_N_CODIGO"]),
                                    NIVANS_T_DESCRI = Convert.ToString(reader["NIVANS_T_DESCRI"]).Trim(),
                                    SESION_T_DESCRI = Convert.ToString(reader["SESION_T_DESCRI"]),
                                    SEMANA_T_DESCRI = Convert.ToString(reader["SEMANA_T_DESCRI"]).Trim(),
                                    SEMANA_N_CANDIA = Convert.ToInt32(reader["SEMANA_N_CANDIA"]),
                                    TECNIC_T_TITULO = Convert.ToString(reader["TECNIC_T_TITULO"]),
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

        public List<TG_TECNICA_DETALLE> ListarTecnica(TG_TRATAMIENTO _e, SqlConnection cn)
        {
            List<TG_TECNICA_DETALLE> _lista = new List<TG_TECNICA_DETALLE>();

            try
            {
                using (SqlCommand sqlCmd = new SqlCommand("PROC_TG_TECNICA_LISTAR", cn))
                {
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add(new SqlParameter("@USUARI_N_CODIGO", _e.USUARI_N_CODIGO));
                    sqlCmd.Parameters.Add(new SqlParameter("@TRATAM_N_CODIGO", _e.TRATAM_N_CODIGO));

                    using (SqlDataReader reader = sqlCmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                TG_TECNICA_DETALLE _el = new TG_TECNICA_DETALLE()
                                {
                                    TECNIC_N_CODIGO = Convert.ToInt32(reader["TECNIC_N_CODIGO"]),
                                    TECNIC_T_TITULO = Convert.ToString(reader["TECNIC_T_TITULO"]).Trim(),
                                    TIPCON_N_CODIGO = Convert.ToInt32(reader["TIPCON_N_CODIGO"]),
                                    TECDET_T_CONTEN = Convert.ToString(reader["TECDET_T_CONTEN"]).Trim(),
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

        public TG_DIAGNOSTICO consultarDiagnostico(TG_DIAGNOSTICO _E, SqlConnection cn)
        {
            TG_DIAGNOSTICO _edl = null;
            try
            {
                using (SqlCommand sqlCmd = new SqlCommand("PROC_TG_DIAGNOSTICO_CONSULTAR", cn))
                {
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add(new SqlParameter("@USUARI_N_CODIGO", _E.USUARI_N_CODIGO));
                    sqlCmd.Parameters.Add(new SqlParameter("@TEST_N_CODIGO", _E.TEST_N_CODIGO));

                    using (SqlDataReader reader = sqlCmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            if (reader.Read())
                            {
                                _edl = new TG_DIAGNOSTICO()
                                {
                                    TEST_T_DESCRI = Convert.ToString(reader["TEST_T_DESCRI"]),
                                    DIAGNO_N_COGPUN = Convert.ToDecimal(reader["DIAGNO_N_COGPUN"]),
                                    DIAGNO_N_FISPUN = Convert.ToDecimal(reader["DIAGNO_N_FISPUN"]),
                                    DIAGNO_N_CONPUN = Convert.ToDecimal(reader["DIAGNO_N_CONPUN"]),
                                    DIAGNO_N_TOTPUN = Convert.ToDecimal(reader["DIAGNO_N_TOTPUN"]),
                                    PUNCOG_T_DESCRI = Convert.ToString(reader["PUNCOG_T_DESCRI"]).Trim(),
                                    PUNFIS_T_DESCRI = Convert.ToString(reader["PUNFIS_T_DESCRI"]).Trim(),
                                    PUNCON_T_DESCRI = Convert.ToString(reader["PUNCON_T_DESCRI"]).Trim(),
                                    PUNDIR_T_DESCRI = Convert.ToString(reader["PUNDIR_T_DESCRI"]).Trim(),
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

            return _edl;
        }
    }
}
