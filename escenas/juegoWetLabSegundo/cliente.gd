extends Sprite2D
var pedido = ["a","a"]
var rng = RandomNumberGenerator.new()

func _ready():
	var rnd1 = rng.randi_range(1,3)
	var rnd2 = rnd1
	while (rnd2 == rnd1):
		rnd2 = rng.randi_range(1,3)
	match GlobalWetGame.dificulty:
		"Tutorial":
			match rnd1:
				1:
					pedido[0]="Red"
				2:
					pedido[0]="Yellow"
				3:
					pedido[0]="Pink"
			match rnd2:
				1:
					pedido[1]="Red"
				2:
					pedido[1]="Yellow"
				3:
					pedido[1]="Pink"

func mostrarPedido():
	for i in pedido.size():
		match pedido[i]:
			"Yellow":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://recursos/liquido2.png")
			"Red":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://recursos/liquido1.png")
			"Pink":
				get_node("../Pedido/Pedido" + str(i+1)).texture = preload("res://recursos/liquido3.png")

func _on_area_2d_mouse_entered() -> void:
	mostrarPedido()
	$"../Pedido".visible=true
	$"../Bocadillo1".visible=true
	
	


func _on_area_2d_mouse_exited() -> void:
	$"../Bocadillo1".visible=false
	$"../Pedido".visible=false


func _on_area_2d_2_mouse_entered() -> void:
	mostrarPedido()
	$"../Pedido".visible=true
	$"../Bocadillo2".visible=true
	
	


func _on_area_2d_2_mouse_exited() -> void:
	$"../Bocadillo2".visible=false
	$"../Pedido".visible=false


func _on_area_2d_3_mouse_entered() -> void:
	mostrarPedido()
	$"../Pedido".visible=true
	$"../Bocadillo2".flip_h=true
	$"../Bocadillo2".visible=true
	
	


func _on_area_2d_3_mouse_exited() -> void:
	$"../Bocadillo2".visible=false
	$"../Bocadillo2".flip_h=false
	$"../Pedido".visible=false


func _on_area_2d_4_mouse_entered() -> void:
	mostrarPedido()
	$"../Pedido".visible=true
	$"../Bocadillo1".flip_h=true
	$"../Bocadillo1".visible=true
	
	


func _on_area_2d_4_mouse_exited() -> void:
	$"../Bocadillo1".visible=false
	$"../Bocadillo1".flip_h=false
	$"../Pedido".visible=false
