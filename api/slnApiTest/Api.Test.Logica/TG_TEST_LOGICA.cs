using Api.Test.Datos;
using Api.Test.Entidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace Api.Test.Logica
{
    public class TG_TEST_LOGICA : TG_BASE
    {
        TG_TEST_DATOS _DATOS_TEST = new TG_TEST_DATOS();
        public List<TG_TEST> ListarTest(TG_TEST _e)
        {
            List<TG_TEST> _lista = new List<TG_TEST>();
            try
            {
                cn.Open();
                _lista = _DATOS_TEST.ListarTest(_e, cn);

            }
            finally { if (cn.State == ConnectionState.Open) cn.Close(); }
            return _lista;
        }

        public TG_DIAGNOSTICO GuardarPuntajeTest(TG_TEST _e)
        {
            TG_DIAGNOSTICO _edl = null;
            bool seGuardo = false;
            int usuario = 0;
            try
            {
                if (_e.LISTA_L_SIREPU.Count > 0)
                {
                    usuario = _e.LISTA_L_SIREPU[0].USUARI_N_CODIGO;
                    cn.Open();
                    using (TransactionScope scope = new TransactionScope())
                    {
                        foreach (var item in _e.LISTA_L_SIREPU)
                        {
                            if (!(seGuardo = _DATOS_TEST.GuardarPuntajeTest(item, cn)))
                                break;
                        }

                        if (seGuardo)
                            _edl = _DATOS_TEST.Diagnosticar(new TG_DIAGNOSTICO() { USUARI_N_CODIGO = _e.LISTA_L_SIREPU[0].USUARI_N_CODIGO, TEST_N_CODIGO = _e.LISTA_L_SIREPU[0].TEST_N_CODIGO }, cn);

                        seGuardo = _edl == null ? false : true;
                        if (seGuardo) scope.Complete();
                    }
                }
            }
            finally { if (cn.State == ConnectionState.Open) cn.Close(); }
            return _edl;
        }

        public List<TG_TRATAMIENTO> ListarTratamiento(TG_USUARIO _e)
        {
            List<TG_TRATAMIENTO> _lista = new List<TG_TRATAMIENTO>();
            try
            {
                cn.Open();
                _lista = _DATOS_TEST.ListarTratamiento(_e, cn);

            }
            finally { if (cn.State == ConnectionState.Open) cn.Close(); }
            return _lista;
        }

        public List<TG_TECNICA_DETALLE> ListarTecnica(TG_TRATAMIENTO _e)
        {
            List<TG_TECNICA_DETALLE> _lista = new List<TG_TECNICA_DETALLE>();
            try
            {
                cn.Open();
                _lista = _DATOS_TEST.ListarTecnica(_e, cn);

            }
            finally { if (cn.State == ConnectionState.Open) cn.Close(); }
            return _lista;
        }
    }
}
