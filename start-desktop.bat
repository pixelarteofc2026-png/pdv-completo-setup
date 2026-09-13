@echo off
chcp 65001 >nul
title PDV - Desktop

echo.
echo ═══════════════════════════════════════════════════════════════
echo           PDV COMPLETO - INICIANDO DESKTOP (WPF)
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
echo ✓ Iniciando Aplicação Desktop
echo.

dotnet run --project PDV.Desktop

pause