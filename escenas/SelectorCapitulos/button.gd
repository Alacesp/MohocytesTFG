extends Button

func _on_mouse_entered():
	get_parent().self_modulate= Color.GRAY

func _on_mouse_exited():
	get_parent().self_modulate = Color.WHITE
