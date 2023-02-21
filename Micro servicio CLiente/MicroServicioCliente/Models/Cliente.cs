using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MicroServicioCliente.Models
{
    public class Cliente:Persona
    {
      

        public int Contrasena { get; set; }

        public bool Estado { get; set; }


        //public int CuentaId { get; set; }
        //public int MovimientoId { get; set; }

        public virtual ICollection<Cuenta> Cuentas { get; set; }
        public virtual ICollection<Movimientos> Movimientos { get; set; }

  




    }
}
