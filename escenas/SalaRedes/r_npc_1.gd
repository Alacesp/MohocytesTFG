extends Sprite2D
@onready var texto: CanvasLayer = get_node("../Cuadro")
var hablado = false

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and !texto.estar_activo():
			texto.encolar(">SD:retratoEsclavo7")
			if Global.redes < 4:
				if hablado == false:
					texto.encolar("R31")
					texto.encolar("R32")
					texto.encolar("R33")
					texto.encolar("R34")
					texto.encolar("R35")
					texto.encolar("R36")
					texto.encolar("R37")
					texto.encolar("R38")
					texto.encolar("R39")
					texto.encolar(">CH")
					texto.encolar("R40")
					texto.encolar(">CH")
					texto.encolar("R41")
					texto.encolar("R42")
					texto.encolar("R43")
					texto.encolar("R44")
					texto.encolar("R45")
					texto.encolar("R46")
					hablado = true
					Global.redes += 1
				else:
					texto.encolar("R47")
					texto.encolar("R48")
			else:
				texto.encolar("R49")
