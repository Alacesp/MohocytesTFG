extends Sprite2D
@onready var manager = get_tree().get_current_scene()
@onready var panelPista = $"../../../../Pistas/FondoPista"
@onready var pista = get_node("../../../../Pistas/" + self.name)


func _on_area_2d_mouse_entered() -> void:
	panelPista.visible = true
	pista.visible = true
	

func _on_area_2d_mouse_exited() -> void:
	panelPista.visible = false
	pista.visible = false


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			if manager.selected == self.name:
				self.visible = false
				get_node("../../Soluciones/" + self.name).visible = true
				manager.tick(self.name)
				manager.selected = null
				manager.puntos += 300
			elif manager.selected != null && manager.selected != self.name:
				manager.puntos -= 100
