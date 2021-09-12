using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.Test.Entidad
{
    public class TG_USUARIO : TG_BASE
    {
        public int USUARI_N_CODIGO { get; set; }
        public string USUARI_T_CORREO { get; set; }
        public string USUARI_T_NOMBRE { get; set; }
        public string USUARI_T_CONTRA { get; set; }
        public int USUARI_N_GENERO { get; set; }
        public string USUARI_T_FECNAC { get; set; }
        public int USUARI_F_ACTIVO { get; set; }
    }
}
