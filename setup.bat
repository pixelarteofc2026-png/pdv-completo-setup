@echo off
chcp 65001 >nul
title PDV Completo - Setup Automático

echo.
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                  PDV COMPLETO - SETUP AUTOMÁTICO                       ║
echo ╚════════════════════════════════════════════════════════════════════════╝
echo.

REM Verificar dependências
echo [1/5] Verificando dependências...
echo.

dotnet --version >nul 2>&1
if errorlevel 1 (
    echo ❌ .NET SDK não encontrado! Instale de: https://dotnet.microsoft.com/download
    pause
    exit /b 1
)
echo ✓ .NET SDK encontrado

node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js não encontrado! Instale de: https://nodejs.org/
    pause
    exit /b 1
)
echo ✓ Node.js encontrado

docker --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Docker não encontrado! Instale de: https://www.docker.com/
    pause
    exit /b 1
)
echo ✓ Docker encontrado

echo.
echo [2/5] Clonando repositório...
if exist pdv-completo (
    echo 📁 Pasta pdv-completo já existe
) else (
    git clone https://github.com/luisroyo/pdv-completo.git
    if errorlevel 1 (
        echo ❌ Erro ao clonar repositório
        pause
        exit /b 1
    )
    echo ✓ Repositório clonado com sucesso
)

cd pdv-completo

echo.
echo [3/5] Iniciando PostgreSQL com Docker...
docker-compose -f pdv-backend/docker-compose.yml up -d
if errorlevel 1 (
    echo ⚠ Aviso: Docker pode estar inativo
)
echo ✓ Docker iniciado

timeout /t 5 /nobreak

echo.
echo [4/5] Configurando Backend (.NET)...
cd pdv-backend

echo Restaurando dependências do .NET...
dotnet restore
if errorlevel 1 (
    echo ❌ Erro ao restaurar dependências .NET
    pause
    exit /b 1
)
echo ✓ Dependências .NET restauradas

echo.
echo Aplicando migrações do banco de dados...
dotnet ef database update --project PDV.Infrastructure --startup-project PDV.API
if errorlevel 1 (
    echo ⚠ Aviso: Erro ao aplicar migrações (banco pode estar indisponível)
)
echo ✓ Migrações processadas

cd ..

echo.
echo [5/5] Configurando Frontend (React)...
cd pdv-frontend

echo Instalando dependências do Node.js...
call npm install
if errorlevel 1 (
    echo ❌ Erro ao instalar dependências Node.js
    pause
    exit /b 1
)
echo ✓ Dependências Node.js instaladas

cd ../..

echo.
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                      ✓ SETUP CONCLUÍDO COM SUCESSO!                    ║
echo ╚════════════════════════════════════════════════════════════════════════╝
echo.
echo Para iniciar o projeto, execute:
echo.
echo Terminal 1 - Backend:
echo   cd pdv-completo\pdv-backend
echo   dotnet run --project PDV.API
echo.
echo Terminal 2 - Frontend:
echo   cd pdv-completo\pdv-frontend
echo   npm run dev
echo.
echo Terminal 3 (opcional) - Desktop:
echo   cd pdv-completo\pdv-backend
echo   dotnet run --project PDV.Desktop
echo.
echo 🌐 Frontend: http://localhost:5173
echo 🔌 Backend:  http://localhost:5000
echo.
pause