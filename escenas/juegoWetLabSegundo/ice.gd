extends Sprite2D
@onready
var borrar= $"../Fregadero"
@onready
var actualizar= $"/root/Minijuego"
var completed = false

func _process(delta):
	if($ProgressBar.value==100):
		completed = true
		$Timer.stop()

func _on_ice_pressed() -> void:
	if (GlobalWetGame.ice != null && completed == true):
		$"../camara/Seleccionado/ProbetaSeleccionada".visible = true
		GlobalWetGame.ice.append("Ice")
		GlobalWetGame.selected = GlobalWetGame.ice
		GlobalWetGame.probetas.append(GlobalWetGame.selected.duplicate())
		actualizar.actualizarSelected()
		actualizar.actualizarInventario()
		GlobalWetGame.ice = null
		$ProgressBar.value = 0
		print(GlobalWetGame.ice)
		print(GlobalWetGame.selected)
	elif(GlobalWetGame.ice == null and GlobalWetGame.selected != null and GlobalWetGame.selected.back()!="Centrifuga"):
		GlobalWetGame.ice = GlobalWetGame.selected.duplicate()
		borrar.borrarDeInventario()
		actualizar.actualizarSelected()
		actualizar.actualizarInventario()
		print(GlobalWetGame.ice)
		print(GlobalWetGame.selected)
		completed = false
		$Timer.start()


func _on_timer_timeout() -> void:
	$ProgressBar.value += 10
