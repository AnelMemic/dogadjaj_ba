
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 7056
ENV ASPNETCORE_URLS=http://+:7056


FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src


COPY Gdogadjaj_ba\dogadjaj_ba.csproj dogadjaj_ba/
RUN dotnet restore "dogadjaj_ba\dogadjaj_ba.csproj"

COPY . .


FROM build AS publish
RUN dotnet publish "dogadjaj_ba\dogadjaj_ba.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "dogadjaj_ba.dll"]