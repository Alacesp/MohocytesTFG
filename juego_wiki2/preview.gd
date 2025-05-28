extends Button
@onready var manager = get_tree().get_current_scene()

func _process(delta: float) -> void:
	if manager.selected == self.name :
		get_parent().modulate = Color.GRAY
	if($tick.visible):
		self.disabled = true

func _on_button_pressed() -> void:
	manager.selected = self.name
	print(manager.selected)
	print(self.name)


func _on_mouse_entered() -> void:
	get_parent().modulate = Color.GRAY


func _on_mouse_exited() -> void:
	get_parent().modulate = Color.WHITE
