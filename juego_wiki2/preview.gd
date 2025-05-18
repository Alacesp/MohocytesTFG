extends Button
@onready var manager = get_tree().get_current_scene()

func _process(delta: float) -> void:
	if($tick.visible):
		self.disabled = true

func _on_button_pressed() -> void:
	manager.selected = self.name
	print(manager.selected)
	print(self.name)
