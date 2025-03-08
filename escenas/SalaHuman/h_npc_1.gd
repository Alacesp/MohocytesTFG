extends Sprite2D

@onready var texto: CanvasLayer = get_node("../Cuadro")

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and !texto.estar_activo():
			texto.encolar(">SD:retratoEsclavo")
			match Global.human:
				0:
					texto.encolar("H80")
				1:
					texto.encolar("H81")
				2:
					texto.encolar("H82")
					texto.encolar("H83")
					texto.encolar("H84")
				3:
					texto.encolar("H85")
					texto.encolar("H86")
