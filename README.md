# 🚀 PDV Completo - Scripts de Automação

Conjunto de scripts para automatizar a instalação e execução do **PDV Completo** (Sistema de Ponto de Venda Fiscal Brasileiro).

## 📋 Conteúdo

Este repositório contém scripts para:
- ✅ Setup automático completo
- ▶️ Iniciar Backend (.NET)
- ▶️ Iniciar Frontend (React)
- ▶️ Iniciar Desktop (WPF)

---

## 🎯 Início Rápido

### **Windows**

#### 1️⃣ Setup Inicial (Execute uma única vez)
```bash
setup.bat
```

#### 2️⃣ Iniciar Backend
```bash
start-backend.bat
```

#### 3️⃣ Iniciar Frontend (novo terminal)
```bash
start-frontend.bat
```

#### 4️⃣ Iniciar Desktop (opcional, novo terminal)
```bash
start-desktop.bat
```

---

### **Linux / macOS**

#### 1️⃣ Setup Inicial (Execute uma única vez)
```bash
chmod +x setup.sh
./setup.sh
```

#### 2️⃣ Iniciar Backend
```bash
chmod +x start-backend.sh
./start-backend.sh
```

#### 3️⃣ Iniciar Frontend (novo terminal)
```bash
chmod +x start-frontend.sh
./start-frontend.sh
```

#### 4️⃣ Iniciar Desktop (opcional, novo terminal)
```bash
chmod +x start-desktop.sh
./start-desktop.sh
```

---

## 📦 O que o Setup Faz

### ✓ Verificações
- ✅ .NET SDK 8+
- ✅ Node.js 18+
- ✅ Docker
- ✅ Git

### ✓ Clonagem
- Clone automático do repositório oficial

### ✓ Backend
- Restauração de dependências .NET
- Inicialização do PostgreSQL com Docker
- Aplicação de migrações do banco de dados

### ✓ Frontend
- Instalação de dependências npm
- Configuração do Vite e Tailwind

---

## 🌐 URLs de Acesso

Após iniciar o projeto:

| Componente | URL | Porta |
|-----------|-----|-------|
| **Frontend (React)** | http://localhost:5173 | 5173 |
| **Backend (API)** | http://localhost:5000 | 5000 |
| **PostgreSQL** | localhost | 5432 |
| **PgAdmin** | http://localhost:5050 | 5050 |

---

## 📁 Estrutura de Diretórios

Após executar `setup.bat` ou `setup.sh`:

```
.
├── pdv-completo/
│   ├── pdv-backend/          ← Backend C# .NET
│   │   ├── PDV.API/
│   │   ├── PDV.Desktop/
│   │   ├── PDV.Core/
│   │   ├── PDV.Infrastructure/
│   │   ├── PDV.Application/
│   │   ��── docker-compose.yml
│   │
│   ├── pdv-frontend/         ← Frontend React
│   │   ├── src/
│   │   ├── public/
│   │   ├── package.json
│   │   └── vite.config.js
│   │
│   └── README.md
│
├── setup.bat / setup.sh
├── start-backend.bat / start-backend.sh
├── start-frontend.bat / start-frontend.sh
├── start-desktop.bat / start-desktop.sh
└── README.md
```

---

## 🔧 Pré-requisitos

Instale antes de usar os scripts:

### Windows
- [.NET 8 SDK](https://dotnet.microsoft.com/download)
- [Node.js 18+](https://nodejs.org/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/)

### Linux
```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install -y dotnet-sdk-8.0 nodejs npm docker.io git

# Fedora
sudo dnf install -y dotnet-sdk-8.0 nodejs npm docker git

# Arch
sudo pacman -S dotnet-sdk nodejs npm docker git
```

### macOS
```bash
# Com Homebrew
brew install dotnet node docker git
```

---

## 🛠️ Troubleshooting

### ❌ "Docker não encontrado"
- Instale Docker Desktop
- Certifique-se de que está rodando

### ❌ "PostgreSQL connection refused"
- Verifique se Docker está rodando: `docker ps`
- Aguarde 5-10 segundos para o banco iniciar
- Verifique os logs: `docker logs pdv-postgres`

### ❌ "npm install falha"
- Delete `node_modules` e `package-lock.json`
- Execute novamente: `npm install`

### ❌ ".NET restore falha"
- Verifique conexão com internet
- Execute: `dotnet nuget update source`

### ❌ "Porta já em uso"
- Backend na porta 5000: `netstat -ano | findstr :5000` (Windows)
- Frontend na porta 5173: `netstat -ano | findstr :5173` (Windows)
- Mate o processo ou use outra porta

---

## 📝 Detalhes dos Scripts

### `setup.bat` / `setup.sh`
**Quando usar:** Uma única vez para configuração inicial
- Verifica dependências
- Clone o repositório
- Inicia PostgreSQL
- Instala dependências .NET
- Instala dependências npm

### `start-backend.bat` / `start-backend.sh`
**Quando usar:** Para iniciar apenas a API
- Inicia Docker
- Executa a API .NET em `http://localhost:5000`

### `start-frontend.bat` / `start-frontend.sh`
**Quando usar:** Para iniciar apenas o Frontend
- Inicia o servidor Vite em `http://localhost:5173`
- Executa em modo desenvolvimento com hot-reload

### `start-desktop.bat` / `start-desktop.sh`
**Quando usar:** Para testar a aplicação Desktop WPF
- Inicia Docker
- Executa a aplicação WPF

---

## 🚀 Próximos Passos

Após o setup:

1. **Abra o Frontend**: http://localhost:5173
2. **Faça login** com credenciais de teste (se configurado)
3. **Comece a usar o PDV**

---

## 📚 Documentação Oficial

- [PDV Completo - GitHub](https://github.com/luisroyo/pdv-completo)
- [.NET Documentation](https://docs.microsoft.com/en-us/dotnet/)
- [React Documentation](https://react.dev/)
- [Docker Documentation](https://docs.docker.com/)

---

## 🤝 Contribuições

Melhorias nos scripts? Abra uma **issue** ou **pull request**!

---

## 📄 Licença

Este repositório segue a mesma licença do [pdv-completo](https://github.com/luisroyo/pdv-completo) - **MIT**

---

## 📞 Suporte

- 📧 Email: suporte@pdv.com
- 🐛 Issues: [GitHub Issues](https://github.com/luisroyo/pdv-completo/issues)
- 📖 Documentação: [docs.pdv.com](https://docs.pdv.com)

---

**Desenvolvido com ❤️ para facilitar a instalação do PDV Completo**
