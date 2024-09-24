#!/bin/bash

# Iniciar o PostgreSQL em background

docker-entrypoint.sh postgres &

# Iniciar Metricbeat

metricbeat -e &

# Aguardar os processos iniciarem

wait -n

# Sair se algum processo finalizar

exit $?