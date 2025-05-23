extends Node2D
@onready var texto: CanvasLayer = get_node("CuadroTexto")

#func _ready() -> void:
	#texto.encolar(">SI:nada")
	#texto.encolar(">SD:1retratoJwlConfiada")
	#texto.encolar("¡Vamos a comenzar!")
	#texto.encolar(">SD:1retratoJwl")
	#texto.encolar("Dejame que te explique como ayudarnos.")
	

func _process(delta: float) -> void:
	$"camara/Label".text = str(GlobalWetGame.puntuacion)

func esPlaca(probeta):
	if(probeta.back()=="Centrifuga"):
		return true
		print(probeta)
	else:
		return false

func actualizarInventario():
	#Controlo las que son visibles
	for i in range(1,5):
		if(i<=GlobalWetGame.probetas.size()):
			if(!esPlaca(GlobalWetGame.probetas[i-1])):
				get_node("camara/Inventario/Probeta" + str(i)).visible = true
			else:
				get_node("camara/Inventario/Placa" + str(i)).visible = true
		else:
			get_node("camara/Inventario/Probeta" + str(i)).visible = false
			get_node("camara/Inventario/Placa" + str(i)).visible = false
			
	#Controlo la aparencia
	var nivel
	for i in GlobalWetGame.probetas.size():
		nivel = 0
		if(!esPlaca(GlobalWetGame.probetas[i])):
			#probetas
			get_node("camara/Inventario/Placa" + str(i+1)).visible = false
			
			for x in range(1,5):
				get_node("camara/Inventario/Probeta" + str(i+1) + "/Probeta" + str(x)).modulate = Color(1,1,1,1)
				get_node("camara/Inventario/Probeta" + str(i+1) + "/ice/ice" + str(x)).visible = false
				get_node("camara/Inventario/Probeta" + str(i+1) + "/fire/fire" + str(x)).visible = false
			
			
			for e in GlobalWetGame.probetas[i].size():
				if(GlobalWetGame.probetas[i][e]!="Ice" and GlobalWetGame.probetas[i][e]!="Fire"):
					get_node("camara/Inventario/Probeta" + str(i+1) + "/Probeta" + str(nivel+1)).modulate = \
						GlobalWetGame.probetas[i][e]
					nivel += 1
				elif(GlobalWetGame.probetas[i][e]=="Ice"):
					get_node("camara/Inventario/Probeta" + str(i+1) + "/ice/ice" + str(nivel)).visible = true
				elif(GlobalWetGame.probetas[i][e]=="Fire"):
					get_node("camara/Inventario/Probeta" + str(i+1) + "/fire/fire" + str(nivel)).visible = true
		else:
			#placas
			print(GlobalWetGame.probetas[i])
			print("La de arriba es placa")
			get_node("camara/Inventario/Probeta" + str(i+1)).visible = false
			print("tendria que ser invisible")
			get_node("camara/Inventario/Placa" + str(i+1)).visible = true
func actualizarSelected():
	var nivel = 0
	if(GlobalWetGame.selected==null):
		$"camara/Seleccionado/Placa".visible=false
		$"camara/Seleccionado/ProbetaSeleccionada".visible=false
	elif(!esPlaca(GlobalWetGame.selected)):
		$"camara/Seleccionado/Placa".visible=false
		for i in range(1,5):
			#$"camara/Seleccionado/ProbetaSeleccionada".visible=true
			#$"camara/Seleccionado/Placa".visible=false
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
	else:
		$"camara/Seleccionado/ProbetaSeleccionada".visible=false
		$"camara/Seleccionado/Placa".visible=true

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


func _on_placa_1_pressed() -> void:
	$camara/Seleccionado/ProbetaSeleccionada.visible = true
	GlobalWetGame.selected = GlobalWetGame.probetas[0]
	actualizarSelected()


func _on_placa_2_pressed() -> void:
	$camara/Seleccionado/ProbetaSeleccionada.visible = true
	GlobalWetGame.selected = GlobalWetGame.probetas[1]
	actualizarSelected()


func _on_placa_3_pressed() -> void:
	$camara/Seleccionado/ProbetaSeleccionada.visible = true
	GlobalWetGame.selected = GlobalWetGame.probetas[2]
	actualizarSelected()


func _on_placa_4_pressed() -> void:
	$camara/Seleccionado/ProbetaSeleccionada.visible = true
	GlobalWetGame.selected = GlobalWetGame.probetas[3]
	actualizarSelected()
