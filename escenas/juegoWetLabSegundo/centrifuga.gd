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
	print("centrifuga pulsada")
	if (GlobalWetGame.centrifuga != null && completed == true ):
		print("eioeoeo")
		$"../camara/Seleccionado/ProbetaSeleccionada".visible = true
		GlobalWetGame.centrifuga.append("Centrifuga")
		GlobalWetGame.selected = GlobalWetGame.centrifuga
		GlobalWetGame.probetas.append(GlobalWetGame.selected.duplicate())
		actualizar.actualizarSelected()
		actualizar.actualizarInventario()
		GlobalWetGame.centrifuga = null
		self.texture = preload("res://recursos/centrifugaAbierta.png")
		$ProgressBar.value = 0
		print(GlobalWetGame.centrifuga)
		print(GlobalWetGame.selected)
	elif(GlobalWetGame.centrifuga == null and GlobalWetGame.selected != null and GlobalWetGame.selected.back()!="Centrifuga"):
		print("Se duplica en centrifuga")
		GlobalWetGame.centrifuga = GlobalWetGame.selected.duplicate()
		print("se va ha borrar")
		borrar.borrarDeInventario()
		print("se ha borrado")
		print("se actualizan selected e inventario")
		actualizar.actualizarSelected()
		actualizar.actualizarInventario()
		self.texture = preload("res://recursos/centrifugaCerrada.png")
		print(GlobalWetGame.centrifuga)
		print(GlobalWetGame.selected)
		completed = false
		print("timer start")
		$Timer.start()


func _on_timer_timeout() -> void:
	$ProgressBar.value += 10
	
