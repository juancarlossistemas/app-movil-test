using Api.Test.Datos;
using Api.Test.Entidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.Test.Logica
{
    public class TG_LOGIN_LOGICA : TG_BASE
    {
        TG_LOGIN_DATOS _D = new TG_LOGIN_DATOS();
        public TG_USUARIO loginUsuario(TG_USUARIO _E)
        {
            TG_USUARIO _el;
            try
            {
                cn.Open();
                _el = _D.Login(_E, cn);
                if (_el != null)
                    if (_el.USUARI_T_CONTRA.Equals(_E.USUARI_T_CONTRA))
                        _el.VALIDAR = 1;
                    else
                        _el.VALIDAR = -1;
                else
                    _el = new TG_USUARIO() { VALIDAR = 0 };

            }
            finally { if (cn.State == ConnectionState.Open) cn.Close(); }

            return _el;
        }
    }
}
