extends Button

func _on_button_down():
	#get_tree().change_scene_to_file("res://escenas/Fin/Creditos.tscn")
	get_tree().change_scene_to_file("res://escenas/Formulario/Formulario.tscn")

func _on_mouse_entered():
	get_parent().modulate.a = 0.85

func _on_mouse_exited():
	get_parent().modulate.a = 1
