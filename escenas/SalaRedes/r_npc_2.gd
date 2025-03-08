extends Sprite2D
@onready var texto: CanvasLayer = get_node("../Cuadro")
var hablado = false

func _ready():
	if Global.redes < 4 and !hablado and Global.jugado_r:
		texto.encolar(">SD:retratoEsclavo8")
		texto.encolar("R50")
		texto.encolar("R51")
		texto.encolar(">CH")
		texto.encolar("R52")
		hablado = true
		Global.redes += 1

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and !texto.estar_activo():
			texto.encolar(">SD:retratoEsclavo8")
			if Global.redes < 4:
				if hablado == false:
					texto.encolar("R53")
					texto.encolar("R54")
					texto.encolar("R55")
					texto.encolar(">CH")
					texto.encolar("R56")
					texto.encolar("R57")
					await texto.esperar()
					Global.jugado_r = true
					get_tree().change_scene_to_file("res://juego_redes/MainMenu.tscn")
				else:
					texto.encolar("R58")
			else:
				texto.encolar("R59")
