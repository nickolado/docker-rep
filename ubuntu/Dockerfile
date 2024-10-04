# Usar imagem base do Ubuntu
FROM ubuntu:20.04

# Atualizar pacotes e instalar dependências necessárias
RUN apt-get update && apt-get install -y wget curl gnupg apt-transport-https

# Adicionar a chave GPG e o repositório do Elastic
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN apt-get install -y software-properties-common
RUN add-apt-repository "deb https://artifacts.elastic.co/packages/7.x/apt stable main"

# Instalar o Metricbeat
RUN apt-get update && apt-get install -y metricbeat && apt install -y filebeat

# Copiar o arquivo de configuração do Metricbeat para o container
COPY /ubuntu/metricbeat.yml /etc/metricbeat/metricbeat.yml
COPY /ubuntu/filebeat.yml /etc/metricbeat/filebeat.yml

# Configurar o Metricbeat para iniciar automaticamente
RUN metricbeat modules enable system
RUN filebeat modules enable system

# Expor a porta padrão do Kibana
EXPOSE 5601
EXPOSE 5044

# Copiar o script de entrada
COPY /ubuntu/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Comando para iniciar o Metricbeat
CMD ["/usr/local/bin/start.sh"]


