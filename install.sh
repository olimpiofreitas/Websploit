#!/bin/bash

echo "[*] Installing Websploit dependencies..."

# Instalar Ruby se não estiver presente
if ! command -v ruby &> /dev/null; then
    echo "[!] Ruby não encontrado. Instalando Ruby..."
    sudo apt update
    sudo apt install -y ruby-full
fi

# Instalar ferramentas externas necessárias
for tool in nuclei sqlmap dirsearch; do
    if ! command -v $tool &> /dev/null; then
        echo "[!] $tool não encontrado. Certifique-se de instalá-lo e adicioná-lo ao PATH."
    else
        echo "[*] $tool encontrado."
    fi
done

# Permissão de execução
chmod +x websploit.rb

echo "[✓] Instalação concluída. Execute com: ./websploit.rb"
