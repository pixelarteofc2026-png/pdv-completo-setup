# PDV Completo - Guia Completo de Instalação e Uso

## 📌 Índice
1. [Visão Geral](#visão-geral)
2. [Arquitetura](#arquitetura)
3. [Instalação](#instalação)
4. [Como Usar](#como-usar)
5. [Recursos](#recursos)
6. [Troubleshooting](#troubleshooting)
7. [FAQ](#faq)

---

## 🎯 Visão Geral

O **PDV Completo** é um Sistema de Ponto de Venda profissional desenvolvido para estabelecimentos comerciais brasileiros com:

✅ **Emissão fiscal automática** (NFC-e, SAT, TEF)
✅ **Integração com hardware** (impressora térmica, balança, scanner)
✅ **Multi-empresa e multi-filial**
✅ **Controle de estoque automático**
✅ **Relatórios fiscais obrigatórios**
✅ **Modo offline com sincronização**
✅ **Backup automático em nuvem**
✅ **Interface responsiva** (desktop, tablet, mobile)

---

## 🏗️ Arquitetura

### Stack Tecnológico

```
┌─────────────────────────────────────────────────┐
│            FRONTEND (React + Vite)              │
│  - Interface Web responsiva                      │
│  - PWA com offline-first                        │
│  - Tailwind CSS para estilos                    │
│  - Zustand para gerenciamento de estado         │
└─────────────────────────────────────────────────┘
                      ↕
                   Axios API
                      ↕
┌─────────────────────────────────────────────────┐
│          BACKEND (C# .NET 8)                    │
│  - API REST com autenticação JWT                │
│  - Entity Framework Core                        │
│  - Clean Architecture                           │
│  - Integração Fiscal (NFC-e, SAT, TEF)         │
└─────────────────────────────────────────────────┘
                      ↕
┌─────────────────────────────────────────────────┐
│      BANCO DE DADOS (PostgreSQL)                │
│  - Dados principais                             │
│  - Backup automático                            │
│  - SQLite local para offline                    │
└─────────────────────────────────────────────────┘
```

### Componentes Principais

| Componente | Tecnologia | Porta | Função |
|-----------|-----------|-------|--------|
| **API Backend** | .NET 8 C# | 5000 | Processamento de negócio |
| **Frontend Web** | React 18 | 5173 | Interface do usuário |
| **Desktop WPF** | .NET WPF | - | Aplicação Desktop |
| **PostgreSQL** | Database | 5432 | Armazenamento de dados |
| **PgAdmin** | UI Admin | 5050 | Gerenciamento DB |

---

## 💻 Instalação

### Pré-requisitos Obrigatórios

#### Windows
```powershell
# Verificar versões instaladas
dotnet --version
node --version
npm --version
git --version
docker --version
```

- [.NET 8 SDK](https://dotnet.microsoft.com/download) (v8.0+)
- [Node.js](https://nodejs.org/) (v18+)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/)
- Visual Studio 2022 ou VS Code

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install -y \
  dotnet-sdk-8.0 \
  nodejs npm \
  docker.io \
  docker-compose \
  git
```

#### macOS
```bash
brew install dotnet node docker git
```

### Instalação Passo a Passo

#### 1️⃣ Clone o repositório
```bash
git clone https://github.com/pixelarteofc2026-png/pdv-completo-setup.git
cd pdv-completo-setup
```

#### 2️⃣ Execute o setup automático

**Windows:**
```batch
setup.bat
```

**Linux/macOS:**
```bash
chmod +x setup.sh
./setup.sh
```

#### 3️⃣ Aguarde a conclusão
- O script verificará dependências
- Clonará o repositório oficial
- Iniciará o PostgreSQL com Docker
- Instalará todas as dependências

---

## 🚀 Como Usar

### Iniciando o Sistema

#### Terminal 1 - Backend
```bash
cd pdv-completo/pdv-backend
dotnet run --project PDV.API
```
✅ API disponível em `http://localhost:5000`

#### Terminal 2 - Frontend
```bash
cd pdv-completo/pdv-frontend
npm run dev
```
✅ Web disponível em `http://localhost:5173`

#### Terminal 3 - Desktop (opcional)
```bash
cd pdv-completo/pdv-backend
dotnet run --project PDV.Desktop
```
✅ Aplicação Desktop abre automaticamente

### Acessando o Sistema

#### 🌐 Frontend Web
```
http://localhost:5173
```

#### 📊 API Backend (Swagger)
```
http://localhost:5000/swagger/index.html
```

#### 🐘 PostgreSQL Admin
```
http://localhost:5050
Username: admin@pgadmin.org
Password: admin
```

---

## ✨ Recursos

### 🛒 Vendas
- Interface otimizada para vendas rápidas
- Leitura de código de barras
- Múltiplas formas de pagamento
- Desconto por item ou percentual
- Display de cliente
- Atalhos de teclado (F1-F12)

### 💰 Caixa
- Abertura/fechamento de caixa
- Controle de movimentos (entrada/saída)
- Relatórios de caixa
- Saldo da sessão
- Histórico de operações

### 📦 Estoque
- Cadastro de produtos com código de barras
- Controle automático de estoque
- Estoque mínimo e máximo
- Campos fiscais (NCM, CFOP, CST)
- Categorização de produtos
- Imagens de produtos

### 📊 Relatórios
- Relatórios fiscais obrigatórios (X, Z, Redução Z)
- Vendas por período
- Produtos mais vendidos
- Análise de clientes
- Gráficos com ECharts
- Exportação em PDF/Excel

### 🔐 Segurança
- Autenticação com JWT
- Controle de permissões por grupo
- Auditoria de ações sensíveis
- Criptografia de dados sensíveis
- Backup automático

### 🔧 Hardware
- Impressora térmica (Epson, Bematech)
- Balança eletrônica (Toledo)
- Scanner de código de barras
- Display de cliente
- Suporte a múltiplas portas COM/USB

### 📱 Offline
- PWA - Progressive Web App
- Funciona sem internet
- Cache inteligente
- Sincronização automática
- IndexedDB para armazenamento local

---

## 🛠️ Troubleshooting

### ❌ Docker não encontrado
**Solução:**
```bash
# Instalar Docker Desktop
# Verificar:
docker ps
```

### ❌ PostgreSQL connection refused
**Solução:**
```bash
# Verificar containers
docker ps

# Ver logs
docker logs pdv-postgres

# Reiniciar containers
docker-compose restart
```

### ❌ npm install falha
**Solução:**
```bash
cd pdv-completo/pdv-frontend
rm -rf node_modules package-lock.json
npm cache clean --force
npm install
```

### ❌ .NET restore falha
**Solução:**
```bash
cd pdv-completo/pdv-backend
dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org
dotnet restore
```

### ❌ Porta 5000 já em uso
**Solução (Windows):**
```batch
netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

**Solução (Linux/macOS):**
```bash
lsof -i :5000
kill -9 <PID>
```

### ❌ Porta 5173 já em uso
**Solução:**
```bash
# Usar porta alternativa
cd pdv-frontend
npm run dev -- --port 5174
```

---

## ❓ FAQ

### P: Posso usar em produção?
**R:** Sim! O sistema está pronto para produção. Recomenda-se:
- Usar certificado SSL/TLS
- Configurar backup automático
- Usar banco de dados em servidor dedicado
- Configurar load balancer se necessário

### P: Como faço backup dos dados?
**R:** O sistema oferece:
- Backup automático diário
- Export manual de dados
- Sincronização em nuvem (configurável)
- Backup do PostgreSQL

### P: Funciona em todos os sistemas operacionais?
**R:** Sim! Totalmente suportado:
- Windows 10/11
- Ubuntu 20.04+
- macOS 11+

### P: Preciso de internet para usar?
**R:** Não! O sistema funciona offline:
- Interface PWA
- Banco de dados local (SQLite)
- Sincronização quando conectado

### P: Como integrar hardware adicional?
**R:** Consulte a documentação de integração:
- Hardware/Impressoras
- Hardware/Balancas
- Hardware/Scanners

### P: Como customizar os temas?
**R:** O sistema suporta temas JSON:
1. Acesse `pdv-frontend/public/themes/`
2. Crie novo arquivo JSON
3. Configure cores, fontes, ícones
4. Selecione na interface

### P: Como adicionar novos usuários?
**R:** Através da interface administrativo:
1. Login como admin
2. Configurações → Usuários
3. Novo usuário
4. Atribuir permissões

---

## 📚 Documentação Adicional

- [PDV Completo - Repositório Oficial](https://github.com/luisroyo/pdv-completo)
- [.NET 8 Docs](https://docs.microsoft.com/en-us/dotnet/)
- [React 18 Docs](https://react.dev/)
- [PostgreSQL Docs](https://www.postgresql.org/docs/)
- [Docker Docs](https://docs.docker.com/)

---

## 🤝 Contribuir

1. Fork o projeto
2. Crie uma branch (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Add MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

---

## 📄 Licença

MIT License - Veja [LICENSE](LICENSE) para detalhes

---

## 📞 Suporte

- 📧 Email: suporte@pdv.com
- 🐛 Issues: [GitHub Issues](https://github.com/luisroyo/pdv-completo/issues)
- 💬 Discussions: [GitHub Discussions](https://github.com/luisroyo/pdv-completo/discussions)
- 📖 Wiki: [Documentação](https://github.com/luisroyo/pdv-completo/wiki)

---

**Desenvolvido com ❤️ para o mercado brasileiro**

*Última atualização: 13 de Setembro de 2026*