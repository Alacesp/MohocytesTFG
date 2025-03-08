extends Sprite2D
@onready var texto: CanvasLayer = get_node("../Cuadro")

func _process(_delta):
	self.visible =  Global.jefes_visible

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and !texto.estar_activo() and self.visible:
			texto.encolar(">SD:retratoJdlSonriente")
			texto.encolar("W77")
			texto.encolar(">CH")
			texto.encolar("W78")
			texto.encolar(">CH")
			texto.encolar("W79")
