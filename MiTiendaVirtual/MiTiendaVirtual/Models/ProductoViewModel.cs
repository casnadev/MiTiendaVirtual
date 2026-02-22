namespace MiTiendaVirtual.Models
{
    public class ProductoViewModel
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public decimal Precio { get; set; }
        public bool Destacado { get; set; }
        public bool Activo { get; set; }
        public string NombreCategoria { get; set; } // Nueva columna
    }
}