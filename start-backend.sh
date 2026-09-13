#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "           PDV COMPLETO - INICIANDO BACKEND (.NET)"
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
echo -e "${GREEN}✓ Iniciando API .NET em http://localhost:5000${NC}"
echo ""

dotnet run --project PDV.API