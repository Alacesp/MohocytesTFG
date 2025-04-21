extends Node2D

func _process(delta):
	
	for i in range(1,5):
		if(i<=GlobalWetGame.probetas.size()):
			get_node("camara/Inventario/Probeta" + str(i)).visible = true
		else:
			get_node("camara/Inventario/Probeta" + str(i)).visible = false


func actualizarInventario():
	for i in GlobalWetGame.probetas.size():
		for x in range(1,5):
			get_node("camara/Inventario/Probeta" + str(i+1) + "/Probeta" + str(x)).modulate = Color(1,1,1,1)
		for e in GlobalWetGame.probetas[i].size():
			get_node("camara/Inventario/Probeta" + str(i+1) + "/Probeta" + str(e+1)).modulate = \
				GlobalWetGame.probetas[i][e]

func actualizarSelected():
	for i in range(1,5):
		get_node("camara/Seleccionado/ProbetaSeleccionada/Probeta"+str(i)).modulate = Color(1,1,1,1)
	for i in range(GlobalWetGame.selected.size()):
		get_node("camara/Seleccionado/ProbetaSeleccionada/Probeta"+str(i+1)).modulate = \
			Color(GlobalWetGame.selected[i])

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
