extends Node2D

func _process(delta):
	
	for i in range(1,5):
		if(i<=GlobalWetGame.probetas.size()):
			get_node("camara/Inventario/Probeta" + str(i)).visible = true
		else:
			get_node("camara/Inventario/Probeta" + str(i)).visible = false


func actualizarInventario():
	var nivel = 0
	for i in GlobalWetGame.probetas.size():
		for x in range(1,5):
			get_node("camara/Inventario/Probeta" + str(i+1) + "/Probeta" + str(x)).modulate = Color(1,1,1,1)
			get_node("camara/Inventario/Probeta" + str(i+1) + "/ice/ice" + str(x)).visible = false
			get_node("camara/Inventario/Probeta" + str(i+1) + "/fire/fire" + str(x)).visible = false
		for e in GlobalWetGame.probetas[i].size():
			if(GlobalWetGame.probetas[i][e]!="Ice" and GlobalWetGame.probetas[i][e]!="Fire" and GlobalWetGame.probetas[i][e]!="Centrifuga"):
				get_node("camara/Inventario/Probeta" + str(i+1) + "/Probeta" + str(nivel+1)).modulate = \
					GlobalWetGame.probetas[i][e]
				nivel += 1
			elif(GlobalWetGame.probetas[i][e]=="Ice"):
				get_node("camara/Inventario/Probeta" + str(i+1) + "/ice/ice" + str(nivel)).visible = true
			elif(GlobalWetGame.probetas[i][e]=="Fire"):
				get_node("camara/Inventario/Probeta" + str(i+1) + "/fire/fire" + str(nivel)).visible = true

func actualizarSelected():
	var nivel = 0
	for i in range(1,5):
		get_node("camara/Seleccionado/ProbetaSeleccionada/Probeta"+str(i)).modulate = Color(1,1,1,1)
		get_node("camara/Seleccionado/ProbetaSeleccionada/ice/ice"+str(i)).visible = false
		get_node("camara/Seleccionado/ProbetaSeleccionada/fire/fire"+str(i)).visible = false
	for i in range(GlobalWetGame.selected.size()):
		if(GlobalWetGame.selected[i]!="Ice" and GlobalWetGame.selected[i]!="Fire" and GlobalWetGame.selected[i]!="Centrifuga"):
			get_node("camara/Seleccionado/ProbetaSeleccionada/Probeta"+str(nivel+1)).modulate = \
				Color(GlobalWetGame.selected[i])
			nivel += 1
		elif(GlobalWetGame.selected[i]=="Ice"):
			get_node("camara/Seleccionado/ProbetaSeleccionada/ice/ice"+str(nivel)).visible = true
		elif(GlobalWetGame.selected[i]=="Fire"):
			get_node("camara/Seleccionado/ProbetaSeleccionada/fire/fire"+str(nivel)).visible = true

func _on_probeta_1_pressed() -> void:
	$camara/Seleccionado/ProbetaSeleccionada.visible = true
	GlobalWetGame.selected = GlobalWetGame.probetas[0]
	actualizarSelected()


func _on_probeta_2_pressed() -> void:
	$camara/Seleccionado/ProbetaSeleccionada.visible = true
	GlobalWetGame.selected = GlobalWetGame.probetas[1]
	actualizarSelected()


func _on_probeta_3_pressed() -> void:
	$camara/Seleccionado/ProbetaSeleccionada.visible = true
	GlobalWetGame.selected = GlobalWetGame.probetas[2]
	actualizarSelected()


func _on_probeta_4_pressed() -> void:
	$camara/Seleccionado/ProbetaSeleccionada.visible = true
	GlobalWetGame.selected = GlobalWetGame.probetas[3]
	actualizarSelected()
