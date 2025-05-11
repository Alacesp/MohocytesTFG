extends Camera2D
var pregunta = 1

func _process(delta: float) -> void:
	if(pregunta==1):
		$Izquierda.visible = false
	else:
		$Izquierda.visible = true
		
	if(pregunta==9):
		$Derecha.visible = false
	else:
		$Derecha.visible = true

func _on_button_pressed_Izq() -> void:
	self.position.x -= 1152
	$"../Fondo".position.x -= 1152
	pregunta -= 1


func _on_button_pressed_Der() -> void:
	self.position.x += 1152
	$"../Fondo".position.x += 1152
	pregunta += 1
