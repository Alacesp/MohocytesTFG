extends Button
@onready var manager = get_tree().get_current_scene()

func _on_button_pressed() -> void:
	manager.selected = self.name
