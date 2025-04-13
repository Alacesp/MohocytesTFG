extends Node

func _process(delta):
	if GlobalWetGame.nivelProbeta >=4:
		GlobalWetGame.nivelProbeta = 0;
		GlobalWetGame.liquidos.clear()



func _on_liquido_3_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	GlobalWetGame.liquidos.append("Rosa")
	print(GlobalWetGame.liquidos)
	print(GlobalWetGame.nivelProbeta)


func _on_liquido_2_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	GlobalWetGame.liquidos.append("Amarillo")
	print(GlobalWetGame.liquidos)
	print(GlobalWetGame.nivelProbeta)


func _on_liquido_1_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	GlobalWetGame.liquidos.append("Rojo")
	print(GlobalWetGame.liquidos)
	print(GlobalWetGame.nivelProbeta)


func _on_liquido_6_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	GlobalWetGame.liquidos.append("Verde")
	print(GlobalWetGame.liquidos)
	print(GlobalWetGame.nivelProbeta)


func _on_liquido_5_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	GlobalWetGame.liquidos.append("Morado")
	print(GlobalWetGame.liquidos)
	print(GlobalWetGame.nivelProbeta)


func _on_liquido_4_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	GlobalWetGame.liquidos.append("Azul")
	print(GlobalWetGame.liquidos)
	print(GlobalWetGame.nivelProbeta)
