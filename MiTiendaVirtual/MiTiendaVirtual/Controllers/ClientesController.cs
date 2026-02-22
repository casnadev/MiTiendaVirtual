using Microsoft.AspNetCore.Mvc;
using MiTiendaVirtual.Models;
using System.Linq;

namespace MiTiendaVirtual.Controllers
{
    public class ClientesController : Controller
    {
        public IActionResult Index()
        {
            using (TiendaVirtualDbContext BD = new TiendaVirtualDbContext())
            {
                var listaClientes = BD.Clientes
                    .OrderBy(c => c.Nombres) // ascendente por Nombres
                    .ToList();

                return View(listaClientes);
            }
        }
    }
}