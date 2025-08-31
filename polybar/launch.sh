#!/usr/bin/env bash

# Elimina las barras ya en ejecución
killall -q polybar

# Inicia tus barras
polybar bar1 &
#polybar bar2 &