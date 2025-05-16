extends Sprite2D
@onready var manager = get_tree().get_current_scene()
#@onready var panelPista = $"../../../../FondoPista"

func _on_button_pressed() -> void:
	if manager.selected == self.name:
		self.visible = false
		get_node("../../Soluciones/" + self.name).visible = true


func _on_area_2d_mouse_entered() -> void:
	print("e")
	#panelPista.visible = true
	print("e")


func _on_area_2d_mouse_exited() -> void:
	#panelPista.visible = false
	print("o")
