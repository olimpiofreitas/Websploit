# Websploit Framework

Websploit Framework é uma ferramenta de segurança web que integra várias ferramentas populares de pentest em uma interface unificada, inspirada no Metasploit Framework.

## 🚀 Características

- Interface estilo Metasploit (`use`, `set`, `show options`, `run`)
- Arquitetura baseada em módulos para scanners, exploits e integrações
- Suporte a módulos personalizados
- Integração com ferramentas externas:
  - [x] Nuclei
  - [x] SQLMap
  - [x] Dirsearch
  - [x] E muito mais...

## 📦 Requisitos

### Instalação Normal
- Ruby >= 2.5
- Ferramentas no `$PATH`:
  - `nuclei`
  - `sqlmap`
  - `dirsearch`

### Instalação com Docker
- Docker
- Docker Compose (opcional)

## 🛠️ Instalação

### Método 1: Instalação Normal

1. Clone o repositório:
```bash
git clone https://github.com/Websploit/websploit.git
cd websploit
```

2. Instale as dependências:
```bash
# Instalar Nuclei
wget https://github.com/projectdiscovery/nuclei/releases/download/v2.9.4/nuclei_2.9.4_linux_amd64.zip
unzip nuclei_2.9.4_linux_amd64.zip
sudo mv nuclei /usr/local/bin/

# Instalar SQLMap
git clone https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap
sudo ln -s /opt/sqlmap/sqlmap.py /usr/local/bin/sqlmap

# Instalar Dirsearch
pip3 install dirsearch
```

3. Execute o framework:
```bash
chmod +x websploit.rb
./websploit.rb
```

### Método 2: Instalação com Docker

1. Clone o repositório:
```bash
git clone https://github.com/Websploit/websploit.git
cd websploit
```

2. Construa a imagem Docker:
```bash
docker build -t websploit .
```

3. Execute o container:
```bash
docker run -it --rm websploit
```

Ou usando Docker Compose:

1. Crie um arquivo `docker-compose.yml`:
```yaml
version: '3'
services:
  websploit:
    build: .
    volumes:
      - ./sessions:/app/sessions
    tty: true
    stdin_open: true
```

2. Execute com Docker Compose:
```bash
docker-compose up
```

## 📁 Módulos Disponíveis

### Scanner
- `scanner/nuclei` - Scanner de vulnerabilidades usando Nuclei
- `scanner/dirsearch` - Scanner de diretórios usando Dirsearch
- `scanner/sqlmap` - Scanner de injeção SQL usando SQLMap
- `scanner/dir_enum` - Enumeração de diretórios com threads

### Exploit
- `exploit/xss` - Teste de Cross-Site Scripting (XSS)
- `exploit/lfi` - Teste de Local File Inclusion (LFI)
- `exploit/ssrf` - Teste de Server-Side Request Forgery (SSRF)
- `exploit/xxe` - Teste de XML External Entity (XXE)
- `exploit/sql_injection` - Teste de injeção SQL

### Auxiliary
- `auxiliary/port_scan` - Scanner de portas

### Post
- `post/shell_upload` - Upload de shells

## 🎮 Uso

### Comandos Básicos
- `help` - Mostra a lista de comandos disponíveis
- `list` - Lista todos os módulos disponíveis
- `use <module>` - Seleciona um módulo para uso
- `set <option> <value>` - Define o valor de uma opção
- `show options` - Mostra as opções disponíveis do módulo atual
- `run` - Executa o módulo selecionado
- `save` - Salva a sessão atual
- `load` - Carrega uma sessão salva
- `exit` ou `quit` - Sai do framework

### Exemplos de Uso

1. Usando o scanner Nuclei:
```
websploit > use scanner/nuclei
websploit (scanner/nuclei) > set target http://example.com
websploit (scanner/nuclei) > set template cves/
websploit (scanner/nuclei) > run
```

2. Testando XSS:
```
websploit > use exploit/xss
websploit (exploit/xss) > set target http://example.com
websploit (exploit/xss) > set param search
websploit (exploit/xss) > run
```

3. Testando LFI:
```
websploit > use exploit/lfi
websploit (exploit/lfi) > set target http://example.com
websploit (exploit/lfi) > set param file
websploit (exploit/lfi) > run
```

## 📦 Módulos Personalizados

Crie um arquivo `.rb` em `modules/scanner/` ou `modules/exploit/`:

```ruby
require_relative '../../core/base_module'

module Websploit
  class MyCustom < Websploit::BaseModule
    path 'scanner/my_custom'

    register_option 'TARGET', default: 'http://localhost', required: true, description: 'Target URL'

    def run
      puts "Running on #{options['TARGET'][:current]}"
    end
  end
end
```

## 🔒 Salvando Sessões

As sessões são salvas no diretório `sessions/` dentro do container. Para persistir as sessões entre execuções, monte o volume como mostrado no exemplo do Docker Compose acima.

## ⚠️ Aviso Legal

Esta ferramenta é para fins **educacionais e testes autorizados** apenas. Use com responsabilidade.

## 👥 Contribuindo

Contribuições são bem-vindas! Por favor, sinta-se à vontade para enviar pull requests.

## 📝 Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo LICENSE para mais detalhes.
