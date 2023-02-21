using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MicroServicioCliente.Models
{
    public abstract class Persona
    {
        [Key]
        public int Id { get; set; }
   
        public string Nombre { get; set; }
       
        public string Genero { get; set; }
       
        public int Edad { get; set; }
       
        public string Direccion { get; set; }
        public string Telefono { get; set; }


    }
}
