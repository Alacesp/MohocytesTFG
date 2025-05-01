extends Node
@onready
var actualizar= $"/root/Minijuego"
@onready
var borrar= $"../Fregadero"
var old = false

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
			get_node("../Probeta/ice/ice" + str(i)).visible = false
			get_node("../Probeta/fire/fire" + str(i)).visible = false
		GlobalWetGame.nivelProbeta = 0
		GlobalWetGame.liquidos.clear()
		actualizar.actualizarInventario()
		print("SELECTED")
		print(GlobalWetGame.selected)
		print("PROBETAS")
		print(GlobalWetGame.probetas)
	elif(GlobalWetGame.nivelProbeta==0 and GlobalWetGame.selected!=null and GlobalWetGame.selected[GlobalWetGame.selected.size()-1]!="Centrifuga"):
		var nivel = 0
		for i in range(GlobalWetGame.selected.size()):
			if(GlobalWetGame.selected[i]!="Ice" and GlobalWetGame.selected[i]!="Fire" and GlobalWetGame.selected[i]!="Centrifuga"):
				get_node("../Probeta/Probeta"+str(nivel+1)).modulate = \
					Color(GlobalWetGame.selected[i])
				nivel += 1
			elif(GlobalWetGame.selected[i]=="Ice"):
				get_node("../Probeta/ice/ice"+str(nivel)).visible = true
			elif(GlobalWetGame.selected[i]=="Fire"):
				get_node("../Probeta/fire/fire"+str(nivel)).visible = true
		GlobalWetGame.liquidos=GlobalWetGame.selected.duplicate()
		GlobalWetGame.nivelProbeta= nivel
		borrar.borrarDeInventario()
