using Microsoft.AspNetCore.Mvc;
using MiTiendaVirtual.Models;
using System.Linq;
using System.Collections.Generic;

namespace MiTiendaVirtual.Controllers
{
    public class ProductosController : Controller
    {
        public IActionResult Index()
        {
            using (TiendaVirtualDbContext BD = new TiendaVirtualDbContext())
            {
                var listaProductos = (from p in BD.Productos
                                      join c in BD.Categoria on p.IdCategoria equals c.Id
                                      select new ProductoViewModel
                                      {
                                          Id = p.Id,
                                          Nombre = p.Nombre,
                                          Precio = p.Precio.GetValueOrDefault(),      // <-- corregido
                                          Destacado = p.Destacado.GetValueOrDefault(),
                                          Activo = p.Activo.GetValueOrDefault(),
                                          NombreCategoria = c.Nombre
                                      }).ToList();

                return View(listaProductos);
            }
        }
    }
}