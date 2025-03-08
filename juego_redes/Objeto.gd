extends Node2D

var offset
var mouseon = false
var dragging = false

var number = -1
var score = 0
var pos_correcta
var pos_inicial
var textura

func _ready():
	number = name.to_int()
	pos_inicial = Vector2(self.position.x, self.position.y)

func _input(_event):
	if !GameGlobal.interactuable or GameGlobal.get_imagen(number) == null:
		return
	if Input.is_action_just_pressed("click"):
		if mouseon:
			dragging = true
			self.scale = Vector2(1.1,1.1)
			offset = global_position - get_global_mouse_position()
	if Input.is_action_pressed("click"):
		if dragging:
			global_position = get_global_mouse_position() + offset
	if Input.is_action_just_released("click"):
		if dragging:
			dragging = false
			self.scale = Vector2(1, 1)
			var distancia = floor(position.distance_to(pos_correcta))
			if distancia < 50:
				score = 10
			elif distancia < 100:
				score = 5
			elif distancia < 200:
				score = 2
			else:
				score = 0

func actualizar_propiedades():
	if GameGlobal.get_imagen(number) == null:
		return
	if TranslationServer.get_locale() == "en":
		textura = load("res://juego_redes/Objetos/"+str(GameGlobal.nivel)+"/I"+GameGlobal.get_imagen(number)+".webp")
		if textura == null:
			textura = load("res://juego_redes/Objetos/"+str(GameGlobal.nivel)+"/"+GameGlobal.get_imagen(number)+".webp")
	else:
		textura = load("res://juego_redes/Objetos/"+str(GameGlobal.nivel)+"/"+GameGlobal.get_imagen(number)+".webp")
	$Sprite.texture = textura
	pos_correcta = GameGlobal.get_pos_correcta(number)

func resetear():
	$Sprite.texture = null
	self.position = pos_inicial

func _on_area_mouse_entered():
	mouseon = true

func _on_area_mouse_exited():
	mouseon = false
