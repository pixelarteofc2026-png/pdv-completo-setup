#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "           PDV COMPLETO - INICIANDO FRONTEND (React)"
echo "═══════════════════════════════════════════════════════════════"
echo ""

if [ ! -d "pdv-completo" ]; then
    echo -e "${RED}❌ Pasta 'pdv-completo' não encontrada!${NC}"
    echo "Execute primeiro: ./setup.sh"
    exit 1
fi

cd pdv-completo/pdv-frontend

echo ""
echo -e "${GREEN}✓ Iniciando Frontend em http://localhost:5173${NC}"
echo ""

npm run dev