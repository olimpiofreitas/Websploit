# Websploit Framework

Websploit Framework é uma ferramenta de segurança web que integra várias ferramentas populares de pentest em uma interface unificada.

## Requisitos

- Docker
- Docker Compose (opcional)

## Instalação com Docker

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

## Módulos Disponíveis

### Scanner/Nuclei
Scanner de vulnerabilidades usando Nuclei:
```
websploit > use scanner/nuclei
websploit (scanner/nuclei) > set target http://example.com
websploit (scanner/nuclei) > set template cves/
websploit (scanner/nuclei) > run
```

### Scanner/Dirsearch
Scanner de diretórios usando Dirsearch:
```
websploit > use scanner/dirsearch
websploit (scanner/dirsearch) > set target http://example.com
websploit (scanner/dirsearch) > set wordlist /usr/share/wordlists/dirb/common.txt
websploit (scanner/dirsearch) > run
```

## Comandos Disponíveis

- `help` - Mostra a lista de comandos disponíveis
- `list` - Lista todos os módulos disponíveis
- `use <module>` - Seleciona um módulo para uso
- `set <option> <value>` - Define o valor de uma opção
- `show options` - Mostra as opções disponíveis do módulo atual
- `run` - Executa o módulo selecionado
- `save` - Salva a sessão atual
- `load` - Carrega uma sessão salva
- `exit` ou `quit` - Sai do framework

## Docker Compose (Opcional)

Para facilitar o uso, você pode usar o Docker Compose:

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

## Salvando Sessões

As sessões são salvas no diretório `sessions/` dentro do container. Para persistir as sessões entre execuções, monte o volume como mostrado no exemplo do Docker Compose acima.

## Contribuindo

Contribuições são bem-vindas! Por favor, sinta-se à vontade para enviar pull requests.

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo LICENSE para mais detalhes.
