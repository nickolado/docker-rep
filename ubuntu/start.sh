#!/bin/bash
# script basico para inicialização dentro do container dos beats
filebeat -e &

metricbeat -e &

wait