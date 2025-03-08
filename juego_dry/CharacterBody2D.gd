extends CharacterBody2D

var velocidad = 12
var lim_izq = -450
var lim_der = 450

func _process(_delta):
	if Input.is_action_pressed("ui_left"):
		if position.x > lim_izq:
			position.x -= velocidad
			$Carro.flip_h = true
	if Input.is_action_pressed("ui_right"):
		if position.x < lim_der:
			position.x += velocidad
			$Carro.flip_h = false
