#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "           PDV COMPLETO - INICIANDO DESKTOP (WPF)"
echo "═══════════════════════════════════════════════════════════════"
echo ""

if [ ! -d "pdv-completo" ]; then
    echo -e "${RED}❌ Pasta 'pdv-completo' não encontrada!${NC}"
    echo "Execute primeiro: ./setup.sh"
    exit 1
fi

cd pdv-completo/pdv-backend

echo "Iniciando PostgreSQL com Docker..."
docker-compose up -d

sleep 3

echo ""
echo -e "${GREEN}✓ Iniciando Aplicação Desktop${NC}"
echo ""

dotnet run --project PDV.Desktop