FROM ruby:3.2

LABEL maintainer="websploit@example.com"
LABEL description="Websploit - Web Offensive Security Framework"

# Diretório de trabalho
WORKDIR /websploit

# Copia os arquivos do projeto
COPY . /websploit

# Instala ferramentas adicionais
RUN apt-get update && apt-get install -y \
    git \
    python3-pip \
    python3 \
    curl \
    unzip

# Instalar sqlmap (versão via git)
RUN git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap
ENV PATH="/opt/sqlmap:$PATH"

# Instalar nuclei
RUN curl -s https://api.github.com/repos/projectdiscovery/nuclei/releases/latest \
  | grep "browser_download_url.*linux_amd64.zip" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | wget -qi - -O nuclei.zip && \
  unzip nuclei.zip -d /usr/local/bin && rm nuclei.zip

# Instalar dirsearch
RUN git clone https://github.com/maurosoria/dirsearch.git /opt/dirsearch
ENV PATH="/opt/dirsearch:$PATH"

# Permissão de execução
RUN chmod +x /websploit/websploit.rb

ENTRYPOINT ["./websploit.rb"]
