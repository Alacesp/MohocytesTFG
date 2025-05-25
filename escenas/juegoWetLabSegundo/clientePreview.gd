extends Sprite2D

@onready
var pedido = get_node("../../../Clientes/" + self.name).pedido

func mostrarPedido():
	for i in pedido.size():
		match pedido[i]:
			"YELLOW":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://escenas/juegoWetLabSegundo/sprites/amarillo.png")
			"RED":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://escenas/juegoWetLabSegundo/sprites/rojo.png")
			"PINK":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://escenas/juegoWetLabSegundo/sprites/rosa.png")
			"Ice":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://escenas/juegoWetLabSegundo/sprites/simbolohielo.png")
			"Fire":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://escenas/juegoWetLabSegundo/sprites/simbolofuego.png")
			"PURPLE":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://escenas/juegoWetLabSegundo/sprites/morado.png")
			"BLUE":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://escenas/juegoWetLabSegundo/sprites/azul.png")
			"GREEN":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://escenas/juegoWetLabSegundo/sprites/verde.png")

func _on_area_2d_mouse_entered() -> void:
	mostrarPedido()
	$"../Pedido".visible=true
	$"../Bocadillo3".visible=true


func _on_area_2d_mouse_exited() -> void:
	$"../Pedido".visible=false
	$"../Bocadillo3".visible=false


func _on_area_2d_2_mouse_entered() -> void:
	mostrarPedido()
	$"../Pedido".visible=true
	$"../Bocadillo4".visible=true


func _on_area_2d_2_mouse_exited() -> void:
	$"../Pedido".visible=false
	$"../Bocadillo4".visible=false


func _on_area_2d_3_mouse_entered() -> void:
	mostrarPedido()
	$"../Pedido".visible=true
	$"../Bocadillo4".flip_h=true
	$"../Bocadillo4".visible=true


func _on_area_2d_3_mouse_exited() -> void:
	$"../Pedido".visible=false
	$"../Bocadillo4".visible=false
	$"../Bocadillo4".flip_h=false


func _on_area_2d_4_mouse_entered() -> void:
	mostrarPedido()
	$"../Pedido".visible=true
	$"../Bocadillo3".flip_h=true
	$"../Bocadillo3".visible=true


func _on_area_2d_4_mouse_exited() -> void:
	$"../Pedido".visible=false
	$"../Bocadillo3".visible=false
	$"../Bocadillo3".flip_h=false
