@echo off
chcp 65001 >nul
title PDV - Backend

echo.
echo ═══════════════════════════════════════════════════════════════
echo           PDV COMPLETO - INICIANDO BACKEND (.NET)
echo ═══════════════════════════════════════════════════════════════
echo.

if not exist pdv-completo (
    echo ❌ Pasta 'pdv-completo' não encontrada!
    echo Execute primeiro: setup.bat
    pause
    exit /b 1
)

cd pdv-completo\pdv-backend

echo Iniciando PostgreSQL com Docker...
docker-compose up -d

timeout /t 3 /nobreak

echo.
echo ✓ Iniciando API .NET em http://localhost:5000
echo.

dotnet run --project PDV.API

pause