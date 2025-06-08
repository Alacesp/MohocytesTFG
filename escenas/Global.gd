extends Node
#¿Se ha empezado el juego desde el principio?
var fullGame = true

#¿Se ha completado el Pretest?
var preTest = true
#Respuesta a pregunta del cuadro de texto
var resp = true

#Variable para que salte el prologo
var prologo = true
var visible_pasillo = false
#Variables para entrar a las habitaciones
var room = 1
var puerta = 0

#Variables de human
var human = 0
var salida_h = false
var jugado_h = false

#Variables de Dry Lab
var dl = 0
var salida_dl = false
var jugado_dl = false

#Variables de Wet Lab
var wl = 0
var salida_wl = false
var jugado_wl = false

#Variables de Redes
var redes = 0
var salida_redes = false
var visible_jwl = false
var jugado_r = false

#Variables de Wiki
var wiki = 0
var salida_wiki = false
var jugado_w = false
var jefes_visible = false

#Puntos
var puntos_human = 0
var puntos_drylab = 0
var puntos_wetlab = 0
var puntos_redes = 0
var puntos_wiki = 0
