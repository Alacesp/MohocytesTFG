extends Sprite2D
@onready var texto: CanvasLayer = get_node("../Cuadro")
var hablado = false

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and !texto.estar_activo():
			texto.encolar(">SD:retratoEsclavo10")
			if Global.wiki <= 2:
				if hablado == false:
					texto.encolar("W53")
					texto.encolar("W54")
					texto.encolar(">CH")
					texto.encolar("W55")
					texto.encolar(">CH")
					texto.encolar("W56")
					texto.encolar(">CH")
					texto.encolar("W57")
					texto.encolar(">CH")
					texto.encolar("W58")
					texto.encolar("W59")
					texto.encolar("W60")
					texto.encolar("W61")
					texto.encolar(">CH")
					texto.encolar("W62")
					hablado = true
					Global.wiki += 1
				else:
					texto.encolar("W63")
			elif Global.wiki == 3:
				texto.encolar("W64")
