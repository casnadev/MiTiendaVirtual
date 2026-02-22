using Microsoft.AspNetCore.Mvc;
using MiTiendaVirtual.Models;
using System.Linq;

namespace MiTiendaVirtual.Controllers
{
    public class PedidosController : Controller
    {
        public IActionResult Index()
        {
            using (TiendaVirtualDbContext BD = new TiendaVirtualDbContext())
            {
                // Traemos los pedidos ordenados por FechaHora ascendente
                var listaPedidos = BD.Pedidos
                    .OrderBy(p => p.FechaHora)
                    .ToList();

                return View(listaPedidos);
            }
        }
    }
}