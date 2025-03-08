extends Sprite2D
@onready var texto: CanvasLayer = get_node("../Cuadro")
var hablado = false

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and !texto.estar_activo():
			texto.encolar(">SD:retratoEsclavo9")
			if Global.wiki <= 2:
				if hablado == false:
					texto.encolar("W45")
					texto.encolar("W46")
					texto.encolar("W47")
					texto.encolar("W48")
					texto.encolar("W49")
					texto.encolar(">CH")
					texto.encolar("W50")
					hablado = true
					Global.wiki += 1
				else:
					texto.encolar("W51")
			elif Global.wiki == 3:
				texto.encolar("W52")
