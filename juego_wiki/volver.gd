extends Button

func _on_pressed():
	get_tree().change_scene_to_file("res://escenas/SalaWiki/SalaWiki.tscn")

func _on_mouse_entered():
	get_parent().modulate.a = 0.85

func _on_mouse_exited():
	get_parent().modulate.a = 1
