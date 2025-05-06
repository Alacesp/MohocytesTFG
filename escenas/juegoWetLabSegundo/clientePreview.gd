extends Sprite2D

@onready
var pedido = get_node("../../../Clientes/" + self.name).pedido

func mostrarPedido():
	for i in pedido.size():
		match pedido[i]:
			"YELLOW":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://recursos/liquido2.png")
			"RED":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://recursos/liquido1.png")
			"PINK":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://recursos/liquido3.png")
			"Ice":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://recursos/copoDeNieve.png")
			"Fire":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://recursos/fuego.png")

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
