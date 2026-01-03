using System.Xml.Serialization;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers(); 

var app = builder.Build();

app.UseHttpsRedirection();

app.MapGet("/" , () =>
{
   Results.Ok("API Berjalan");
});

app.Run();
