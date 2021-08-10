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
    public class TG_USUARIO_LOGICA : TG_BASE
    {
        TG_USUARIO_DATOS _D = new TG_USUARIO_DATOS();
        public bool GuardarUsuario(TG_USUARIO _E)
        {
            bool seGuardo = false;

            try
            {
                cn.Open();
                seGuardo = _D.GuardarUsuario(_E, cn);
            }
            finally { if (cn.State == ConnectionState.Open) cn.Close(); }

            return seGuardo;
        }
    }
}
