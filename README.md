#  Aclaro de que aún no está listo por completo esta configuración, está en un 30% más o menos... 

Para la instalación básica de BSPWM utilice los siguientes paquetes.

Siempre y cuando partiendo desde una instalación de alguna distro con xfce.
#### Instalar dependencias recomendadas:
```
sudo apt install bspwm sxhkd rofi dunst compton picom polybar vim terminator synapse variety flameshot 
```

#### Crear directorios necesarios para las configuraciones:
```
mkdir ~/.config/bspwm && mkdir ~/.config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd
```

#### Hacer ejecutable el siguiente archivo:
```
chmod +x bspwmrc

```

#### Mi configuración de SXHKDRC, la cual es provisoria por ahora: 
```
#
# wm independent hotkeys
#

# terminal emulator
super + Return
	terminator

# program launcher (rofi)
super + d
	rofi -modi run -show run

# synapse launcher
super + shift + d
	synapse

# make sxhkd reload its configuration files:
super + Escape
	pkill -USR1 -x sxhkd

# captura de pantalla con flameshot
Print
	flameshot gui

# bloqueo de pantalla con blur
super + shift + x
	scrot /tmp/screen_locked.png && convert /tmp/screen_locked.png -blur 0x12 /tmp/screen_blurred.png && i3lock -i /tmp/screen_blurred.png && rm /tmp/screen_locked.png /tmp/screen_blurred.png

# controles de volumen
XF86AudioRaiseVolume
	pactl set-sink-volume @DEFAULT_SINK@ +10%
XF86AudioLowerVolume
	pactl set-sink-volume @DEFAULT_SINK@ -10%
XF86AudioMute
	pactl set-sink-mute @DEFAULT_SINK@ toggle
XF86AudioMicMute
	pactl set-source-mute @DEFAULT_SOURCE@ toggle

#
# bspwm hotkeys
#

# quit/restart bspwm (como i3: $mod+Shift+q y $mod+Shift+r)
super + shift + q
	bspc quit
super + shift + r
	bspc wm -r

# close window (como i3: $mod+q)
super + q
	bspc node -c

# kill window (como i3 pero con diferente shortcut)
super + shift + k
	bspc node -k

# alternate between the tiled and monocle layout
super + m
	bspc desktop -l next

# toggle floating/tiled (como i3: $mod+Shift+space)
super + shift + space
	bspc node -t ~floating

# fullscreen toggle (como i3: $mod+f)
super + f
	bspc node -t fullscreen

#
# state/flags
#

# set the window state (tiled, pseudo_tiled, floating)
super + shift + t
	bspc node -t tiled
super + shift + t
	bspc node -t pseudo_tiled
super + s
	bspc node -t floating

#
# focus/swap - Estilo i3
#

# focus the node in the given direction (como i3: j,k,l,ñ)
super + j
	bspc node -f west
super + k
	bspc node -f south
super + l
	bspc node -f north
super + ntilde
	bspc node -f east

# flechas direccionales para focus
super + Left
	bspc node -f west
super + Down
	bspc node -f south
super + Up
	bspc node -f north
super + Right
	bspc node -f east

# move window to direction (como i3: Shift+j,k,l,ñ)
super + shift + j
	bspc node -s west
super + shift + k
	bspc node -s south
super + shift + l
	bspc node -s north
super + shift + ntilde
	bspc node -s east

# flechas direccionales para mover ventanas
super + shift + Left
	bspc node -s west
super + shift + Down
	bspc node -s south
super + shift + Up
	bspc node -s north
super + shift + Right
	bspc node -s east

# focus the next/previous window (como i3: Tab)
super + Tab
	bspc node -f next.local.!hidden.window
super + shift + Tab
	bspc node -f prev.local.!hidden.window

# focus workspaces (desktops) como i3
super + 1
	bspc desktop -f '^1'
super + 2
	bspc desktop -f '^2'
super + 3
	bspc desktop -f '^3'
super + 4
	bspc desktop -f '^4'
super + 5
	bspc desktop -f '^5'
super + 6
	bspc desktop -f '^6'
super + 7
	bspc desktop -f '^7'
super + 8
	bspc desktop -f '^8'
super + 9
	bspc desktop -f '^9'
super + 0
	bspc desktop -f '^10'

# move window to workspace como i3
super + shift + 1
	bspc node -d '^1'
super + shift + 2
	bspc node -d '^2'
super + shift + 3
	bspc node -d '^3'
super + shift + 4
	bspc node -d '^4'
super + shift + 5
	bspc node -d '^5'
super + shift + 6
	bspc node -d '^6'
super + shift + 7
	bspc node -d '^7'
super + shift + 8
	bspc node -d '^8'
super + shift + 9
	bspc node -d '^9'
super + shift + 0
	bspc node -d '^10'

# focus parent/child containers
super + a
	bspc node -f @parent
# super + d - ya está usado por rofi

#
# layout management - Adaptado de i3
#

# split horizontal como i3 ($mod+h)
super + h
	bspc node -p east

# split vertical como i3 ($mod+v)
super + v
	bspc node -p south

# toggle split direction (similar a i3 $mod+e)
super + e
	bspc node @/ -R 180

# change container layout (stacked, tabbed)
super + s
	bspc desktop -l next
super + w
	bspc desktop -l next

#
# resize - Estilo i3
#

# enter resize mode (como i3: $mod+r)
super + r
	# Modo resize manual con h/j/k/l/ñ
	echo "Modo resize: Usa h/j/k/l/ñ para redimensionar"

# Modo resize con teclas específicas
super + ctrl + j
	bspc node -z left -20 0
super + ctrl + k
	bspc node -z bottom 0 20
super + ctrl + l
	bspc node -z top 0 -20
super + ctrl + ntilde
	bspc node -z right 20 0

super + ctrl + shift + j
	bspc node -z right -20 0
super + ctrl + shift + k
	bspc node -z top 0 20
super + ctrl + shift + l
	bspc node -z bottom 0 -20
super + ctrl + shift + ntilde
	bspc node -z left 20 0

#
# aplicaciones específicas
#

# brave browser
super + b
	brave-browser

# thunar file manager
super + t
	thunar

#
# workspace management
#

# switch to next/previous workspace
super + bracketleft
	bspc desktop -f prev.local
super + bracketright
	bspc desktop -f next.local

# move window to next/previous workspace
super + shift + bracketleft
	bspc node -d prev.local
super + shift + bracketright
	bspc node -d next.local
```

#  Desde aquí, cositas para Polybar

#### 1. Crear un archivo de configuración de Polybar
Crea el directorio:
```
~/.config/polybar
```
si no existe: 
```
mkdir -p ~/.config/polybar
```
Copia un archivo de configuración de ejemplo o crea tu propio **config.ini** en ese directorio: 
```
cp /etc/polybar/config.ini ~/.config/polybar/
```
Edita :
```
~/.config/polybar/config.ini
```
para configurar las secciones bar y modules según tus preferencias. 

#### 2. Integra polybar en bspwm
Abre el archivo 
```
~/.config/bspwm/bspwmrc
```
en un editor de texto.
Añade la siguiente línea al inicio del archivo para que BSPWM lance tu barra:
```
polybar example >>/tmp/polybar1.log 2>&1 &
```
Asegúrate de que example sea el nombre de tu barra en el **config.ini**. 

#### 3. Crear un script de lanzamiento (opcional pero recomendado) 
Crea un script en:
```
~/.config/polybar/launch.sh
```
En este script, puedes lanzar todas tus barras, gestionando las instancias existentes:
```
#!/usr/bin/env bash

# Elimina las barras ya en ejecución
killall -q polybar

# Inicia tus barras
polybar bar1 &
#polybar bar2 &
```

Asegúrate de que bar1 y bar2 correspondan a los nombres de las barras definidas en tu **config.ini**. 

Dale permisos de ejecución al script: 
```
chmod +x ~/.config/polybar/launch.sh
```

#### 4. Ejecutar tu configuración
- Asegúrate de que tu script **launch.sh** se ejecute al iniciar **BSPWM**. 
- Reinicia **BSPWM** para aplicar los cambios. Puedes hacerlo ejecutando bspwm en una terminal o usando el atajo de teclado **Super+Alt+R**. 
