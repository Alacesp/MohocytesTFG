extends Sprite2D
@onready
var actualizar= $"/root/Minijuego"

func _on_button_pressed() -> void:
	var found = false
	var i = 0
	$"../camara/Seleccionado/ProbetaSeleccionada".visible = false
	print("SELECTED:")
	print(GlobalWetGame.selected)
	
	while (i < GlobalWetGame.probetas.size() && !found):
		print(GlobalWetGame.probetas[i])
		print(GlobalWetGame.selected)
		print(GlobalWetGame.probetas[i] == GlobalWetGame.selected)
		print("-------------------------------------------------")
		if GlobalWetGame.probetas[i] == GlobalWetGame.selected:
			GlobalWetGame.probetas.remove_at(i)
			found = true
		else:
			i += 1
	actualizar.actualizarInventario()

	print("i:" + str(i))
	print(GlobalWetGame.probetas)
