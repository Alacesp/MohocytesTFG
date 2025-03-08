extends Button

func _on_pressed():
	get_tree().change_scene_to_file("res://escenas/Pasillo/Pasillo.tscn")

func _on_mouse_entered():
	get_parent().modulate.a = 0.85

func _on_mouse_exited():
	get_parent().modulate.a = 1

func _on_button_down():
	get_parent().modulate.a = 0.7

func _on_button_up():
	get_parent().modulate.a = 0.85
