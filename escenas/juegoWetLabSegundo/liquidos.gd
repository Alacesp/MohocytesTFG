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
		GlobalWetGame.liquidos.append("PINK")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("PINK")
		print(GlobalWetGame.liquidos)
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_2_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("YELLOW")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("YELLOW")
		print(GlobalWetGame.liquidos)
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_1_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("RED")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("RED")
		print(GlobalWetGame.liquidos)
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_6_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("GREEN")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("GREEN")
		print(GlobalWetGame.liquidos)
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_5_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("PURPLE")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("PURPLE")
		print(GlobalWetGame.liquidos)
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_4_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("BLUE")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("BLUE")
		print(GlobalWetGame.liquidos)
		print(GlobalWetGame.nivelProbeta)


func _on_probeta_pressed() -> void:
	if (GlobalWetGame.nivelProbeta!=0):
		GlobalWetGame.selected = GlobalWetGame.probetas.size()
		GlobalWetGame.probetas[GlobalWetGame.probetas.size()] = GlobalWetGame.liquidos.duplicate()
		$"../camara/Seleccionado/ProbetaSeleccionada".visible = true
		for i in range(1,5):
			get_node("../camara/Seleccionado/ProbetaSeleccionada/Probeta"+str(i)).modulate = Color(1,1,1,1)
		for i in range(GlobalWetGame.probetas[GlobalWetGame.probetas.size()-1].size()):
			get_node("../camara/Seleccionado/ProbetaSeleccionada/Probeta"+str(i+1)).modulate = \
				Color(GlobalWetGame.probetas[GlobalWetGame.probetas.size()-1][i])
		print(GlobalWetGame.probetas)
