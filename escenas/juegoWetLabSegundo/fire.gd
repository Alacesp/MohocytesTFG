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

func _on_fire_pressed() -> void:
	if (GlobalWetGame.fire != null && completed == true && GlobalWetGame.probetas.size()<4):
		$"../camara/Seleccionado/ProbetaSeleccionada".visible = true
		GlobalWetGame.fire.append("Fire")
		GlobalWetGame.selected = GlobalWetGame.fire
		GlobalWetGame.probetas.append(GlobalWetGame.selected.duplicate())
		actualizar.actualizarSelected()
		actualizar.actualizarInventario()
		GlobalWetGame.fire = null
		$ProgressBar.value = 0
		print(GlobalWetGame.fire)
		print(GlobalWetGame.selected)
	elif(GlobalWetGame.fire == null and GlobalWetGame.selected != null and GlobalWetGame.selected.back()!="Centrifuga"):
		GlobalWetGame.fire = GlobalWetGame.selected.duplicate()
		borrar.borrarDeInventario()
		actualizar.actualizarSelected()
		actualizar.actualizarInventario()
		print(GlobalWetGame.fire)
		print(GlobalWetGame.selected)
		completed = false
		$Timer.start()


func _on_timer_timeout() -> void:
	$ProgressBar.value += 10
