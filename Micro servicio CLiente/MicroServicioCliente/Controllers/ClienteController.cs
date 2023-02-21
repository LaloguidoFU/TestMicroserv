using MicroServicioCliente.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace MicroServicioCliente.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClienteController : ControllerBase
    {
        private readonly WalletContextDb _context;

        public ClienteController(WalletContextDb context)
        {
            _context = context;
        }




        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var listClientes = await _context.Personas.ToListAsync();
                return Ok(listClientes);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }




        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Persona personas)
        {

            try
            {
                _context.Add(personas);
                await _context.SaveChangesAsync();
                return Ok(personas);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }




        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Persona personas)
        {
            try
            {
                if (id != personas.Id)
                {
                    return NotFound();
                }
                _context.Update(personas);
                await _context.SaveChangesAsync();
                return Ok(new { message = "El cliente fue actualizado  Correctamente" });
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }




        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            try
            {
                var persona = await _context.Personas.FindAsync(id);
                if (persona == null)
                {
                    return NotFound();
                }
                _context.Personas.Remove(persona);
                await _context.SaveChangesAsync();
                return Ok(new { message = "El cliente fue eliminado correctamente" });

            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }



    }
}
