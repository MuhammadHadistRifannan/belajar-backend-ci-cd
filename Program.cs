using System.Xml.Serialization;

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.UseUrls("http://0.0.0.0:5071");
builder.Services.AddControllers(); 

var app = builder.Build();

app.UseHttpsRedirection();

app.MapGet("/" , () =>
{
   Results.Ok("API Berjalan");
});

app.Run();
