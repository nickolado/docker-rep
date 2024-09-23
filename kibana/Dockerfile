# Imagem oficial do Kibana

FROM docker.elastic.co/kibana/kibana:7.17.0

# Metricbeat

RUN apt-get update && \
    apt-get install -y wget && \
    wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-8.9.0-amd64.deb && \
    dpkg -i metricbeat-7.17.0-amd64.deb
    rm metricbeat-7.17.0-amd64.deb

# Copiar a configuração do metricbeat para o container

COPY .\metricbeat\metricbeat.yml /etc/metricbeat/metricbeat.yml

# Permissões

RUN chown root:metricbeat /etc/metricbeat/metricbeat.yml