FROM ruby:3.0-slim

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Instalar ferramentas de segurança
RUN pip3 install dirsearch

# Instalar Nuclei
RUN wget -q https://github.com/projectdiscovery/nuclei/releases/download/v2.9.4/nuclei_2.9.4_linux_amd64.zip \
    && unzip nuclei_2.9.4_linux_amd64.zip \
    && mv nuclei /usr/local/bin/ \
    && rm nuclei_2.9.4_linux_amd64.zip

# Instalar SQLMap
RUN git clone https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap \
    && ln -s /opt/sqlmap/sqlmap.py /usr/local/bin/sqlmap

# Criar diretório da aplicação
WORKDIR /app

# Copiar arquivos do projeto
COPY . .

# Criar diretório para sessões
RUN mkdir -p sessions

# Tornar o script executável
RUN chmod +x websploit.rb

# Definir o comando padrão
ENTRYPOINT ["./websploit.rb"]
