extends Node

@onready
var camara = get_node("../camara")


func _on_boton_1_pressed() -> void:
	camara.position.x = 1728


func _on_boton_2_pressed() -> void:
	camara.position.x = 576


func _on_boton_3_pressed() -> void:
	camara.position.x = 2880


func _on_boton_4_pressed() -> void:
	camara.position.x = 1728


func _on_boton_5_pressed() -> void:
	camara.position.x = 4032


func _on_boton_6_pressed() -> void:
	camara.position.x = 2880

	
