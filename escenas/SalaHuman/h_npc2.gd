extends Sprite2D

@onready var texto: CanvasLayer = get_node("../Cuadro")

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and !texto.estar_activo():
			texto.encolar(">SD:retratoEsclavo2")
			match Global.human:
				0:
					texto.encolar("H87")
				1:
					texto.encolar("H88")
				2:
					texto.encolar("H89")
					texto.encolar("H90")
				3:
					texto.encolar("H91")
					texto.encolar(">PR")
					texto.encolar(">MN")
					await texto.esperar()
					texto.encolar(">SI:retratoPj")
					texto.encolar(">SD:retratoEsclavo2")
					if Global.resp == true:
						texto.encolar("H92")
						texto.encolar("H93")
						texto.encolar("H94")
						texto.encolar("H95")
						texto.encolar("H96")
						texto.encolar("H97")
						texto.encolar("H98")
						texto.encolar(">CH")
						texto.encolar("H99")
						texto.encolar("H100")
					else:
						texto.encolar("H101")
