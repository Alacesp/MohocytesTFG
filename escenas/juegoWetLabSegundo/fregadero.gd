extends Sprite2D
@onready
var actualizar= $"/root/Minijuego"

func borrarDeInventario():
	var found = false
	var i = 0
	$"../camara/Seleccionado/ProbetaSeleccionada".visible = false
	$"../camara/Seleccionado/Placa".visible = false
	while (i < GlobalWetGame.probetas.size() && !found):
		if GlobalWetGame.probetas[i] == GlobalWetGame.selected:
			GlobalWetGame.probetas.remove_at(i)
			found = true
		else:
			i += 1
	actualizar.actualizarInventario()
	print("i:" + str(i))
	print(GlobalWetGame.probetas)

func _on_button_pressed() -> void:
	borrarDeInventario()
