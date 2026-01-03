# ===============================
# Build stage
# ===============================
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# copy csproj & restore (biar cache kepake)
COPY *.csproj ./
RUN dotnet restore

# copy sisanya & publish
COPY . ./
RUN dotnet publish -c Release -o /out

# ===============================
# Runtime stage
# ===============================
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app

COPY --from=build /out .

ENV ASPNETCORE_URLS=http://+:5071
EXPOSE 5071

ENTRYPOINT ["dotnet", "MyApi.dll"]
