using Microsoft.AspNetCore.Mvc;
using MiTiendaVirtual.Models;
using System.Linq;

namespace MiTiendaVirtual.Controllers
{
    public class TarjetasController : Controller
    {
        public IActionResult Index()
        {
            using (TiendaVirtualDbContext BD = new TiendaVirtualDbContext())
            {
                var listaTarjetas = BD.Tarjeta
                    .OrderBy(t => t.Marca) // ascendente por Marca
                    .ToList();

                return View(listaTarjetas);
            }
        }
    }
}