extends Camera2D


func _on_button_derecha_pressed() -> void:
	if self.position.x != 5184:
		print($"../Fondo".position.x)
		self.position.x = self.position.x + 1152
		$"../Fondo".position.x = $"../Fondo".position.x  + 1152
	else:
		self.position.x = 576
		$"../Fondo".position.x = 0
	print($"../Fondo".position.x)

func _on_button_izquierda_pressed() -> void:
	if self.position.x != 576:
		self.position.x = self.position.x - 1152
		$"../Fondo".position.x = $"../Fondo".position.x  - 1152
	else:
		self.position.x = 5184
		$"../Fondo".position.x = 4608
