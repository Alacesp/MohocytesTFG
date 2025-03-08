extends Button

func _on_button_down():
	Score.points = 0
	Score.remaining_time = 90
	Score.secuencia = 0
	Score.secuencia_obs = 0
	get_tree().change_scene_to_file("res://juego_dry/GameScene.tscn")

func _on_mouse_entered():
	get_parent().modulate.a = 0.85

func _on_mouse_exited():
	get_parent().modulate.a = 1
