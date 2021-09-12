using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.Test.Entidad
{
    public class TG_DIAGNOSTICO
    {
        public int DIAGNO_N_CODIGO { get; set; }
        public int TEST_N_CODIGO { get; set; }
        public int USUARI_N_CODIGO { get; set; }
        public decimal DIAGNO_N_COGPUN { get; set; }
        public decimal DIAGNO_N_FISPUN { get; set; }
        public decimal DIAGNO_N_CONPUN { get; set; }
        public decimal DIAGNO_N_TOTPUN { get; set; }
        public decimal PUNCOG_N_CODIGO { get; set; }
        public decimal PUNFIS_N_CODIGO { get; set; }
        public decimal PUNCON_N_CODIGO { get; set; }
        public decimal PUNDIR_N_CODIGO { get; set; }
        public string PUNCOG_T_DESCRI { get; set; }
        public string PUNFIS_T_DESCRI { get; set; }
        public string PUNCON_T_DESCRI { get; set; }
        public string PUNDIR_T_DESCRI { get; set; }
        public int DIAGNO_F_ACTIVO { get; set; }
    }
}
