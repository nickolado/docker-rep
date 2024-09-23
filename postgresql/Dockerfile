# Imagem Postgres

FROM postgres:15.1

# Variaveis do ambiente do BD

ENV POSTGRES_DB=testes
ENV POSTGRES_USER=daniel
ENV POSTGRESS_PASSWORD=123456789

# Copiar arquivos SQL ou scripts para inicializar o banco de dados (opcional)
# Coloque seus arquivos .sql ou .sh em uma pasta chamada "scripts" no mesmo diretório do Dockerfile
# Eles serão executados quando o container for iniciado

COPY ./scripts/ /docker-entrypoint-initdb.d/

# Expor a porta padrão do PostgreSQL
EXPOSE 5432