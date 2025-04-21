extends Node
@onready
var actualizar= $"/root/Minijuego"

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
		print("LIQUIDOS:")
		print(GlobalWetGame.liquidos)
		print("NIVEL PROBETA")
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_2_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("YELLOW")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("YELLOW")
		print("LIQUIDOS:")
		print(GlobalWetGame.liquidos)
		print("NIVEL PROBETA")
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_1_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("RED")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("RED")
		print("LIQUIDOS:")
		print(GlobalWetGame.liquidos)
		print("NIVEL PROBETA")
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_6_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("GREEN")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("GREEN")
		print("LIQUIDOS:")
		print(GlobalWetGame.liquidos)
		print("NIVEL PROBETA")
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_5_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("PURPLE")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("PURPLE")
		print("LIQUIDOS:")
		print(GlobalWetGame.liquidos)
		print("NIVEL PROBETA")
		print(GlobalWetGame.nivelProbeta)


func _on_liquido_4_pressed() -> void:
	GlobalWetGame.nivelProbeta += 1
	if (GlobalWetGame.nivelProbeta <= 4):
		GlobalWetGame.liquidos.append("BLUE")
		get_node("../Probeta/Probeta" + str(GlobalWetGame.nivelProbeta)).modulate = Color("BLUE")
		print("LIQUIDOS:")
		print(GlobalWetGame.liquidos)
		print("NIVEL PROBETA")
		print(GlobalWetGame.nivelProbeta)





func _on_probeta_pressed() -> void:
	if (GlobalWetGame.nivelProbeta!=0 && GlobalWetGame.probetas.size()<4):
		GlobalWetGame.probetas.append(GlobalWetGame.liquidos.duplicate())
		GlobalWetGame.selected = GlobalWetGame.probetas[GlobalWetGame.probetas.size()-1].duplicate()
		$"../camara/Seleccionado/ProbetaSeleccionada".visible = true
		actualizar.actualizarSelected()
		for i in range(1,5):
			get_node("../Probeta/Probeta" + str(i)).modulate = Color(1,1,1,1)
		GlobalWetGame.nivelProbeta = 0
		GlobalWetGame.liquidos.clear()
		actualizar.actualizarInventario()
		print("SELECTED")
		print(GlobalWetGame.selected)
		print("PROBETAS")
		print(GlobalWetGame.probetas)
