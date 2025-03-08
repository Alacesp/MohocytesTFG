extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var texto: CanvasLayer = get_node("../Cuadro")
@onready var pas1: Sprite2D = get_node("../Pasillo")
@onready var pas2: Sprite2D = get_node("../PasilloI")
@onready var pas3: Sprite2D = get_node("../PasilloD")

const SPEED = 900.0
const JUMP_VELOCITY = -600.0

var aux = 0

var puerta_1 = false
var puerta_2 = false
var puerta_3 = false
var puerta_4 = false
var puerta_5 = false
var puerta_6 = false

func _physics_process(_delta):
	var movimiento = Input.get_axis("ui_left", "ui_right")
	if movimiento and !texto.estar_activo():
		velocity.x = movimiento * SPEED
		sprite.play("andar")
		if movimiento > 0:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		sprite.play("quieto")
	move_and_slide()

func _ready():
	match Global.puerta:
		1:
			self.position.x = 377
		2:
			self.position.x = 1057
		3:
			self.position.x = 1684
		4:
			self.position.x = 2330
		5:
			self.position.x = 3106
		6:
			self.position.x = 3778
	################    PROLOGO  ##########################
	if Global.prologo:
		self.visible = false
		texto.encolar(">SI:nada")
		texto.encolar(">VO")
		texto.encolar("PAS1")
		texto.encolar(">MN")
		await texto.esperar()
		self.visible = true
		texto.encolar(">SI:retratoPj")
		texto.encolar("PAS2")
		texto.encolar("PAS3")
		texto.encolar("PAS4")
		texto.encolar("PAS5")
		texto.encolar("PAS6")
		texto.encolar(">MN")
		texto.encolar(">CH")
		texto.encolar(">VN")
		await texto.esperar()
		pas1.visible = true
		pas2.visible = true
		pas3.visible = true
		Global.visible_pasillo = true 
		Global.prologo = false
		texto.encolar("PAS7")
		texto.encolar("PAS8")
		texto.encolar("PAS9")
		texto.encolar("PAS10")
	################    FIN DEL PROLOGO  ##########################

func _process(_delta):
	if puerta_1 or puerta_2 or puerta_3 or puerta_4 or puerta_5 or puerta_6:
		get_node("Entrar").visible = true
	else:
		get_node("Entrar").visible = false
	if Input.is_key_pressed(KEY_UP) and !texto.estar_activo():
		if puerta_1:
			if Global.room < 7:
				Global.puerta = 1
				get_tree().change_scene_to_file("res://escenas/SalaHuman/SalaHuman.tscn")
			else:
				texto.encolar(">CH")
				texto.encolar("PAS11")
		elif puerta_2:
			if Global.room > 1 and Global.room < 7:
				Global.puerta = 2
				get_tree().change_scene_to_file("res://escenas/SalaDryLab/SalaDryLab.tscn")
			elif Global.room == 7:
				texto.encolar(">CH")
				texto.encolar("PAS11")
			else:
				texto.encolar(">VO")
				texto.encolar("PAS12")
		elif puerta_3:
			match Global.room:
				1:
					texto.encolar(">CH")
					texto.encolar("PAS12")
				2:
					texto.encolar(">CH")
					texto.encolar("PAS13")
				3:
					Global.puerta = 3
					get_tree().change_scene_to_file("res://escenas/SalaWetLab/SalaWetLab.tscn")
				4:
					Global.puerta = 3
					get_tree().change_scene_to_file("res://escenas/SalaWetLab/SalaWetLab.tscn")
				5:
					Global.puerta = 3
					get_tree().change_scene_to_file("res://escenas/SalaWetLab/SalaWetLab.tscn")
				6:
					Global.puerta = 3
					get_tree().change_scene_to_file("res://escenas/SalaWetLab/SalaWetLab.tscn")
				7:
					texto.encolar(">CH")
					texto.encolar("PAS11")
		elif puerta_4:
			match Global.room:
				1:
					texto.encolar(">CH")
					texto.encolar("PAS12")
				2:
					texto.encolar(">CH")
					texto.encolar("PAS13")
				3:
					texto.encolar(">CH")
					texto.encolar("PAS14")
				4:
					texto.encolar(">CH")
					texto.encolar("PAS15")
				5:
					Global.puerta = 4
					get_tree().change_scene_to_file("res://escenas/SalaRedes/SalaRedes.tscn")
				6:
					Global.puerta = 4
					get_tree().change_scene_to_file("res://escenas/SalaRedes/SalaRedes.tscn")
				7:
					texto.encolar(">CH")
					texto.encolar("PAS11")
		elif puerta_5:
			match Global.room:
				1:
					texto.encolar(">CH")
					texto.encolar("PAS12")
				2:
					texto.encolar(">CH")
					texto.encolar("PAS13")
				3:
					texto.encolar(">CH")
					texto.encolar("PAS14")
				4:
					texto.encolar(">CH")
					texto.encolar("PAS15")
				5:
					texto.encolar(">CH")
					texto.encolar("PAS16")
				6:
					Global.puerta = 5
					get_tree().change_scene_to_file("res://escenas/SalaWiki/SalaWiki.tscn")
				7:
					texto.encolar(">CH")
					texto.encolar("PAS11")
		elif puerta_6:
			match Global.room:
				1:
					texto.encolar(">CH")
					texto.encolar("PAS12")
				2:
					texto.encolar(">CH")
					texto.encolar("PAS13")
				3:
					texto.encolar(">CH")
					texto.encolar("PAS14")
				4:
					texto.encolar(">CH")
					texto.encolar("PAS15")
				5:
					texto.encolar(">CH")
					texto.encolar("PAS16")
				6:
					texto.encolar(">CH")
					texto.encolar("PAS17")
					texto.encolar("PAS18")
				7:
					Global.puerta = 6
					get_tree().change_scene_to_file("res://escenas/Fin/Fin.tscn")

func _on_area_2d_area_entered(area):
	if area.is_in_group("PortalDer") or area.is_in_group("PortalIzq"):
		position.x = 1200

func _on_puerta_1_body_entered(_body):
	puerta_1 = true

func _on_puerta_1_body_exited(_body):
	puerta_1 = false

func _on_puerta_2_body_entered(_body):
	puerta_2 = true

func _on_puerta_2_body_exited(_body):
	puerta_2 = false

func _on_puerta_3_body_entered(_body):
	puerta_3 = true

func _on_puerta_3_body_exited(_body):
	puerta_3 = false

func _on_puerta_4_body_entered(_body):
	puerta_4 = true

func _on_puerta_4_body_exited(_body):
	puerta_4 = false

func _on_puerta_5_body_entered(_body):
	puerta_5 = true

func _on_puerta_5_body_exited(_body):
	puerta_5 = false

func _on_puerta_6_body_entered(_body):
	puerta_6 = true

func _on_puerta_6_body_exited(_body):
	puerta_6 = false
