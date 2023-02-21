using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MicroServicioCliente.Models
{
    public class Cuenta
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int IdCuenta { get; set; }

        public string NumeCuen { get; set; }

        public string TipoCuen { get; set; }
        public double SaldInic { get; set; }
        public bool Estado { get; set; }
      



        public int? ClienteId { get; set; }
        public Cliente Clientes { get; set; }


    }
}
