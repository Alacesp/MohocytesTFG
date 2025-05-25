extends Sprite2D
var pedido = []
var rng = RandomNumberGenerator.new()
var satisfied = false
var reroll=false
@onready
var borrar= $"../../Fregadero"
@onready
var actualizar= $"/root/Minijuego"

func _ready():
	crearPedido()

func _process(delta: float) -> void:
	if(reroll):
		reroll = false
		crearPedido()

func getPedido():
	return pedido

func crearPedido():
	pedido.clear()
	var rnd1 = rng.randi_range(1,3)
	var rnd2 = rng.randi_range(1,3)
	var rnd3 = rng.randi_range(1,2)
	var rnd4 = rng.randi_range(1,3)
	var rnd5 = rng.randi_range(1,3)
	
					
	if(GlobalWetGame.dificulty >= 1):
		match rnd1:
			1:
				pedido.append("RED")
			2:
				pedido.append("YELLOW")
			3:
				pedido.append("PINK")
		match rnd2:
			1:
				pedido.append("RED")
			2:
				pedido.append("YELLOW")
			3:
				pedido.append("PINK")
	if(GlobalWetGame.dificulty >= 2):
		match rnd3:
			1:
				pedido.append("Ice")
			2:
				pedido.append("Fire")
	if(GlobalWetGame.dificulty >= 3):
		match rnd1:
			1:
				pedido.append("GREEN")
			2:
				pedido.append("PURPLE")
			3:
				pedido.append("BLUE")
		match rnd2:
			1:
				pedido.append("GREEN")
			2:
				pedido.append("PURPLE")
			3:
				pedido.append("BLUE")
	pedido.append("Centrifuga")
	print(pedido)

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and GlobalWetGame.selected!=null:
			print("Aciertos:")
			GlobalWetGame.puntuacion += (compararPedido() * 100)
			satisfied = true
			self.visible=false
			get_node("../../camara/Clientes/" + self.name).visible = false
			print(self.name)
			borrar.borrarDeInventario()
			actualizar.actualizarSelected()
			actualizar.actualizarInventario()

func compararPedido():
	print("Entra a comparar")
	var size
	var aciertos=0
	if (GlobalWetGame.selected.size()<pedido.size()):
		size = GlobalWetGame.selected.size()
	else:
		size = pedido.size()
		print("size")
	print(size)
	for i in size:
		print(GlobalWetGame.selected[i])
		print(pedido[i])
		if (GlobalWetGame.selected[i]==pedido[i]):
			aciertos += 1
			print("acierto: +100")
	return aciertos

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
