using Api.Test.Datos;
using Api.Test.Entidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
    }
}
