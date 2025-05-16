extends Node2D
var pantalla = 1

func _process(delta: float) -> void:
	if(pantalla == 1):
		$Izquierda.visible = false
	else:
		$Izquierda.visible = true
		
	if(pantalla == 8):
		$Derecha.visible = false
	else:
		$Derecha.visible = true

func _on_pressed_der() -> void:
	get_node("../Pagina" + str(pantalla)).visible = false
	pantalla += 1
	get_node("../Pagina" + str(pantalla)).visible = true


func _on_pressed_izq() -> void:
	get_node("../Pagina" + str(pantalla)).visible = false
	pantalla -= 1
	get_node("../Pagina" + str(pantalla)).visible = true
