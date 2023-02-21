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
    public class MovimientosController : ControllerBase
    {
        private readonly WalletContextDb _context;

        public MovimientosController(WalletContextDb context)
        {
            _context = context;
        }



        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var listMov = await _context.Movimientos.ToListAsync();
                return Ok(listMov);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }




        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Movimientos mov)
        {

            try
            {
                _context.Add(mov);
                await _context.SaveChangesAsync();
                return Ok(mov);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }




        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Movimientos mov)
        {
            try
            {
                if (id != mov.IdMovimiento)
                {
                    return NotFound();
                }
                _context.Update(mov);
                await _context.SaveChangesAsync();
                return Ok(new { message = "El movimiento fue actualizado Correctamente" });
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
                var mov = await _context.Movimientos.FindAsync(id);
                if (mov == null)
                {
                    return NotFound();
                }
                _context.Movimientos.Remove(mov);
                await _context.SaveChangesAsync();
                return Ok(new { message = "El movimiento fue eliminado Correctamente" });

            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }


    }
}
