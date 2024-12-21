FROM ubuntu:20.04

# Instalar pacotes básicos e ferramentas de emulação
RUN apt-get update && apt-get install -y \
    openbox \
    novnc \
    x11vnc \
    qemu-system-x86 \
    wget \
    curl \
    unzip \
    && apt-get clean

# Configurar NoVNC
RUN mkdir -p /opt/novnc/utils/websockify && \
    wget -O /opt/novnc/novnc.zip https://github.com/novnc/noVNC/archive/refs/heads/master.zip && \
    unzip /opt/novnc/novnc.zip -d /opt/novnc && \
    mv /opt/novnc/noVNC-master/* /opt/novnc && \
    rm -rf /opt/novnc/novnc.zip /opt/novnc/noVNC-master

# Copiar arquivos do site para o contêiner
COPY web /var/www/html

# Copiar script de inicialização
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Porta para o NoVNC
EXPOSE 8080

CMD ["/start.sh"]
