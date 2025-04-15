extends Node

func _process(delta):
	if GlobalWetGame.nivelProbeta >=5:
		GlobalWetGame.nivelProbeta = 0;
		GlobalWetGame.liquidos.clear()
		for i in range(1,5):
			get_node("../Probeta/Probeta" + str(i)).modulate = Color(1,1,1,1)



func _on_liquido_3_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("Rosa")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("PINK")
		print(GlobalWetGame.liquidos)
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_2_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("Amarillo")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("YELLOW")
		print(GlobalWetGame.liquidos)
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_1_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("Rojo")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("RED")
		print(GlobalWetGame.liquidos)
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_6_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("Verde")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("GREEN")
		print(GlobalWetGame.liquidos)
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_5_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("Morado")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("PURPLE")
		print(GlobalWetGame.liquidos)
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_4_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("Azul")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("BLUE")
		print(GlobalWetGame.liquidos)
		print(GlobalWetGame.nivelProbeta)
