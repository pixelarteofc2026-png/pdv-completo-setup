#!/bin/bash

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo ""
echo "╔════════════════════════════════════════════════════════════════════════╗"
echo "║                  PDV COMPLETO - SETUP AUTOMÁTICO                       ║"
echo "╚════════════════════════════════════════════════════════════════════════╝"
echo ""

# Verificar dependências
echo "[1/5] Verificando dependências..."
echo ""

if ! command -v dotnet &> /dev/null; then
    echo -e "${RED}❌ .NET SDK não encontrado!${NC}"
    echo "Instale de: https://dotnet.microsoft.com/download"
    exit 1
fi
echo -e "${GREEN}✓${NC} .NET SDK encontrado"

if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js não encontrado!${NC}"
    echo "Instale de: https://nodejs.org/"
    exit 1
fi
echo -e "${GREEN}✓${NC} Node.js encontrado"

if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker não encontrado!${NC}"
    echo "Instale de: https://www.docker.com/"
    exit 1
fi
echo -e "${GREEN}✓${NC} Docker encontrado"

if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git não encontrado!${NC}"
    echo "Instale usando seu gerenciador de pacotes"
    exit 1
fi
echo -e "${GREEN}✓${NC} Git encontrado"

echo ""
echo "[2/5] Clonando repositório..."
if [ -d "pdv-completo" ]; then
    echo "📁 Pasta pdv-completo já existe"
else
    git clone https://github.com/luisroyo/pdv-completo.git
    if [ $? -ne 0 ]; then
        echo -e "${RED}❌ Erro ao clonar repositório${NC}"
        exit 1
    fi
    echo -e "${GREEN}✓${NC} Repositório clonado com sucesso"
fi

cd pdv-completo

echo ""
echo "[3/5] Iniciando PostgreSQL com Docker..."
docker-compose -f pdv-backend/docker-compose.yml up -d
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}⚠ Aviso: Docker pode estar inativo${NC}"
fi
echo -e "${GREEN}✓${NC} Docker iniciado"

sleep 5

echo ""
echo "[4/5] Configurando Backend (.NET)..."
cd pdv-backend

echo "Restaurando dependências do .NET..."
dotnet restore
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Erro ao restaurar dependências .NET${NC}"
    exit 1
fi
echo -e "${GREEN}✓${NC} Dependências .NET restauradas"

echo ""
echo "Aplicando migrações do banco de dados..."
dotnet ef database update --project PDV.Infrastructure --startup-project PDV.API
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}⚠ Aviso: Erro ao aplicar migrações (banco pode estar indisponível)${NC}"
fi
echo -e "${GREEN}✓${NC} Migrações processadas"

cd ..

echo ""
echo "[5/5] Configurando Frontend (React)..."
cd pdv-frontend

echo "Instalando dependências do Node.js..."
npm install
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Erro ao instalar dependências Node.js${NC}"
    exit 1
fi
echo -e "${GREEN}✓${NC} Dependências Node.js instaladas"

cd ../..

echo ""
echo "╔═════════════════════════════════════════��══════════════════════════════╗"
echo "║                      ✓ SETUP CONCLUÍDO COM SUCESSO!                    ║"
echo "╚════════════════════════════════════════════════════════════════════════╝"
echo ""
echo "Para iniciar o projeto, execute em terminais diferentes:"
echo ""
echo -e "${BLUE}Terminal 1 - Backend:${NC}"
echo "  cd pdv-completo/pdv-backend"
echo "  dotnet run --project PDV.API"
echo ""
echo -e "${BLUE}Terminal 2 - Frontend:${NC}"
echo "  cd pdv-completo/pdv-frontend"
echo "  npm run dev"
echo ""
echo -e "${BLUE}Terminal 3 (opcional) - Desktop:${NC}"
echo "  cd pdv-completo/pdv-backend"
echo "  dotnet run --project PDV.Desktop"
echo ""
echo -e "${GREEN}🌐 Frontend:${NC} http://localhost:5173"
echo -e "${GREEN}🔌 Backend:${NC}  http://localhost:5000"
echo ""