extends Sprite2D
@onready
var borrar= $"../Fregadero"
@onready
var actualizar= $"/root/Minijuego"

func _on_fire_pressed() -> void:
	if (GlobalWetGame.fire != null):
		$"../camara/Seleccionado/ProbetaSeleccionada".visible = true
		GlobalWetGame.selected = GlobalWetGame.fire
		GlobalWetGame.probetas.append(GlobalWetGame.selected.duplicate())
		actualizar.actualizarSelected()
		actualizar.actualizarInventario()
		GlobalWetGame.fire = null
		print(GlobalWetGame.fire)
		print(GlobalWetGame.selected)
	else:
		GlobalWetGame.fire = GlobalWetGame.selected.duplicate()
		borrar.borrarDeInventario()
		actualizar.actualizarSelected()
		actualizar.actualizarInventario()
		print(GlobalWetGame.fire)
		print(GlobalWetGame.selected)
