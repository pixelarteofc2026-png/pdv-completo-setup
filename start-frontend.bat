@echo off
chcp 65001 >nul
title PDV - Frontend

echo.
echo ═══════════════════════════════════════════════════════════════
echo           PDV COMPLETO - INICIANDO FRONTEND (React)
echo ═══════════════════════════════════════════════════════════════
echo.

if not exist pdv-completo (
    echo ❌ Pasta 'pdv-completo' não encontrada!
    echo Execute primeiro: setup.bat
    pause
    exit /b 1
)

cd pdv-completo\pdv-frontend

echo.
echo ✓ Iniciando Frontend em http://localhost:5173
echo.

npm run dev

pause