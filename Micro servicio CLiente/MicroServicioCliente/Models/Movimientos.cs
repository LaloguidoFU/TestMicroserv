using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MicroServicioCliente.Models
{
    public class Movimientos
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int IdMovimiento { get; set; }

        public DateTime Fecha { get; set; }

        public string TipoMovi { get; set; }
        public double Valor { get; set; }
        public double Saldo { get; set; }


        public int? ClienteId { get; set; }
        public Cliente Clientes { get; set; }




        //public int ClienteId { get; set; }
        //[ForeignKey("ClienteId")]
        //public virtual Cliente Cliente { get; set; }

    }
}
