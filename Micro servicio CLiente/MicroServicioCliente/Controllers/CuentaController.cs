using MicroServicioCliente.Models;
using Microsoft.AspNetCore.Http;
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
    public class CuentaController : ControllerBase
    {

        private readonly WalletContextDb _context;

        public CuentaController(WalletContextDb context)
        {
            _context = context;
        }




        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var listCuen = await _context.Cuentas.ToListAsync();
                return Ok(listCuen);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }




        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Cuenta cuenta)
        {

            try
            {
                _context.Add(cuenta);
                await _context.SaveChangesAsync();
                return Ok(cuenta);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }




        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Cuenta cuenta)
        {
            try
            {
                if (id != cuenta.IdCuenta)
                {
                    return NotFound();
                }
                _context.Update(cuenta);
                await _context.SaveChangesAsync();
                return Ok(new { message = "La cuenta fue actualizada Correctamente" });
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
                var cuenta = await _context.Cuentas.FindAsync(id);
                if (cuenta == null)
                {
                    return NotFound();
                }
                _context.Cuentas.Remove(cuenta);
                await _context.SaveChangesAsync();
                return Ok(new { message = "La cuenta  fue eliminada Correctamente" });

            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }






    }
}
