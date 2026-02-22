using Microsoft.EntityFrameworkCore;
using MiTiendaVirtual.Models;



var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// AQUÍ agregas el Db que optimiza el acceso el EntityFramework EFCore
builder.Services.AddDbContext<TiendaVirtualDbContext>(options =>
    options.UseSqlServer(
        builder.Configuration.GetConnectionString("TiendaVirtualDBConn")));
// Hasta aquí es el código agregado ----
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
