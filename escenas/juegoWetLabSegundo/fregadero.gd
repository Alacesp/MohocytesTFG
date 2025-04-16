extends Sprite2D


func _on_button_pressed() -> void:
	$"../camara/Seleccionado/ProbetaSeleccionada".visible = false
	print(GlobalWetGame.selected)
	GlobalWetGame.probetas.erase(GlobalWetGame.selected)
	print(GlobalWetGame.probetas)
