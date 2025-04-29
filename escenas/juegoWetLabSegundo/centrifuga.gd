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

func _on_centrifugadora_pressed() -> void:
	if (GlobalWetGame.centrifuga != null && completed == true ):
		$"../camara/Seleccionado/ProbetaSeleccionada".visible = true
		GlobalWetGame.selected = GlobalWetGame.centrifuga
		GlobalWetGame.probetas.append(GlobalWetGame.selected.duplicate())
		actualizar.actualizarSelected()
		actualizar.actualizarInventario()
		GlobalWetGame.centrifuga = null
		self.texture = preload("res://recursos/centrifugaAbierta.png")
		$ProgressBar.value = 0
		print(GlobalWetGame.centrifuga)
		print(GlobalWetGame.selected)
	elif(GlobalWetGame.centrifuga == null):
		GlobalWetGame.centrifuga = GlobalWetGame.selected.duplicate()
		borrar.borrarDeInventario()
		actualizar.actualizarSelected()
		actualizar.actualizarInventario()
		self.texture = preload("res://recursos/centrifugaCerrada.png")
		print(GlobalWetGame.centrifuga)
		print(GlobalWetGame.selected)
		completed = false
		$Timer.start()


func _on_timer_timeout() -> void:
	$ProgressBar.value += 10
