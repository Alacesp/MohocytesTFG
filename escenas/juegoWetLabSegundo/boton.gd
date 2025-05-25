extends Button


func _on_mouse_entered() -> void:
	get_parent().modulate = Color.GRAY


func _on_mouse_exited() -> void:
	get_parent().modulate = Color.WHITE
