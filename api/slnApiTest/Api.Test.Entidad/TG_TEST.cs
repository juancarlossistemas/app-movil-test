using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Api.Test.Entidad
{
    public class TG_TEST
    {
        public int TEST_N_CODIGO { get; set; }
        public string TEST_T_DESCRI { get; set; }
	    public int SITUAC_N_CODIGO { get; set; }
	    public string SITUAC_T_DESCRI { get; set; }
	    public int SECCIO_N_CODIGO { get; set; }
	    public string SECCIO_T_DESCRI { get; set; }
	    public int RESPUE_N_CODIGO { get; set; }
	    public string RESPUE_T_DESCRI { get; set; }
	    public int SITRES_N_CODIGO { get; set; }
        public List<TG_SITUACION_RESPUESTA_PUNTAJE> LISTA_L_SIREPU { get; set; }
    }
}
