extends Button
func _on_mouse_entered():
	get_parent().modulate.a = 0.85

func _on_mouse_exited():
	get_parent().modulate.a = 1


func _on_focus_entered() -> void:
	get_parent().modulate = Color.GRAY


func _on_focus_exited() -> void:
	get_parent().modulate = Color.WHITE
