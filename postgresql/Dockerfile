# Imagem Postgres

FROM postgres:15.1

# Atualizar pacotes e instalar dependências necessárias
RUN apt-get update && apt-get install -y wget curl gnupg apt-transport-https

# Adicionar a chave GPG e o repositório do Elastic
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN apt-get install -y software-properties-common
RUN add-apt-repository "deb https://artifacts.elastic.co/packages/7.x/apt stable main"

# Instalar o Metricbeat
RUN apt-get update && apt-get install -y metricbeat

# Copiar o arquivo de configuração do Metricbeat para o container
COPY /postgres/metricbeat.yml /etc/metricbeat/metricbeat.yml

# Variaveis do ambiente do BD
ENV POSTGRES_DB=testes
ENV POSTGRES_USER=daniel
ENV POSTGRESS_PASSWORD=123456

# Copiar arquivos SQL ou scripts para inicializar o banco de dados (opcional)
# Coloque seus arquivos .sql ou .sh em uma pasta chamada "scripts" no mesmo diretório do Dockerfile
# Eles serão executados quando o container for iniciado

# COPY ./scripts/ /docker-entrypoint-initdb.d/

# Expor a porta padrão do PostgreSQL e Metricbeat
EXPOSE 5432
EXPOSE 5066

# Adicionar entrypoint para iniciar o PostgreSQL e Metricbeat
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Set the default command to run PostgreSQL
CMD ["postgres"]