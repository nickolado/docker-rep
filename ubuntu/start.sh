#!/bin/bash

filebeat -e &

metricbeat -e 

wait