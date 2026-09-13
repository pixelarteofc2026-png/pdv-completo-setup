# PDV Completo - Quick Start Guide

## ⚡ Início Rápido (5 minutos)

### 1. Clone e Configure
```bash
git clone https://github.com/pixelarteofc2026-png/pdv-completo-setup.git
cd pdv-completo-setup

# Windows
setup.bat

# Linux/macOS
chmod +x setup.sh && ./setup.sh
```

### 2. Inicie os Serviços

**Terminal 1 - Backend:**
```bash
start-backend.bat          # Windows
# ou
./start-backend.sh        # Linux/macOS
```

**Terminal 2 - Frontend:**
```bash
start-frontend.bat         # Windows
# ou
./start-frontend.sh       # Linux/macOS
```

### 3. Acesse o Sistema
```
🌐 Frontend: http://localhost:5173
🔌 Backend API: http://localhost:5000/swagger
```

---

## 📋 Checklist de Setup

- [ ] .NET 8 SDK instalado
- [ ] Node.js 18+ instalado
- [ ] Docker Desktop em execução
- [ ] Git instalado
- [ ] Scripts de setup executados
- [ ] Backend iniciado e rodando
- [ ] Frontend iniciado e rodando
- [ ] Acessar http://localhost:5173

---

## 🎯 Primeiros Passos no PDV

### 1. Login
- Usar credenciais padrão (se configuradas)
- Mudar senha na primeira vez

### 2. Configurar Empresa
- Nome e CNPJ
- Endereço fiscal
- Dados bancários (opcional)
- Logo e cores

### 3. Cadastrar Produtos
- Código de barras
- Nome e descrição
- Preço de custo e venda
- Estoque inicial
- Impostos (NCM, CFOP, CST)

### 4. Abrir Caixa
- Valor inicial
- Observações
- Confirmar

### 5. Primeira Venda
- Escanear produto ou digitar código
- Confirmar quantidade
- Selecionar forma de pagamento
- Emitir nota fiscal

---

## 🔗 Links Úteis

| Recurso | URL |
|---------|-----|
| Frontend | http://localhost:5173 |
| API Swagger | http://localhost:5000/swagger |
| PgAdmin | http://localhost:5050 |
| GitHub | https://github.com/luisroyo/pdv-completo |
| Documentação | [INSTALLATION_GUIDE.md](INSTALLATION_GUIDE.md) |

---

## ⚠️ Problemas Comuns

### Porta já em uso
```bash
# Windows
netstat -ano | findstr :5000
taskkill /PID <número> /F

# Linux/macOS
lsof -i :5000
kill -9 <PID>
```

### Docker não conecta
```bash
# Reiniciar Docker
docker restart

# Ou
docker-compose restart
```

### npm install falhando
```bash
cd pdv-completo/pdv-frontend
rm -rf node_modules package-lock.json
npm cache clean --force
npm install
```

---

**Precisa de ajuda? Veja [INSTALLATION_GUIDE.md](INSTALLATION_GUIDE.md) para mais detalhes!**