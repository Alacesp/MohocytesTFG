extends CanvasLayer
@onready var arb = get_tree()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if(!self.visible):
			self.visible = true
		else:
			self.visible = false


func _on_button_pressed() -> void:
	arb.change_scene_to_file("res://escenas/Formulario/Formulario.tscn")
