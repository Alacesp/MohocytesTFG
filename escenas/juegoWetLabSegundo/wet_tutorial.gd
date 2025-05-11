extends Control
var pantalla = 0
@onready var arb = get_tree()

func _ready() -> void:
	loadPantalla()

func _process(delta: float) -> void:
	if pantalla == 0:
		$Izquierda.visible = false
	else:
		$Izquierda.visible = true
	if pantalla == 3:
		$Derecha.visible = false
		$Salir.visible = true
	else:
		$Derecha.visible = true
		$Salir.visible = false

func loadPantalla():
	match pantalla:
		0:
			$Tutorial/Titulo.text = "¡Ayudanos a crear las muestras!"
			$Tutorial/Texto.text = "En WetLab vamos mal de tiempo, y vamos a necesitar
			que nos ayudes a crear las placas que nos hacen falta."
		1:
			$Tutorial/Titulo.text = "Peticiones de los miembros"
			$Tutorial/Texto.text = "Miembros del laboratorio vendrán a pedirte que les crees una muestra específica." + \
			" Pasa el ratón por encima de ellos para que te digan que quieren. Puedes hacer lo mismo con " + \
			"los iconos de sus caras en la parte de arriba de la pantalla."
		2:
			$Tutorial/Titulo.text = "Sigue los pasos que te indican"
			$Tutorial/Texto.text = "Cada símbolo significa un paso. Selecciona los tarros correctos" +\
			" y mete las probetas en los instrumentos indicados siguiendo cuidadosamente las instrucciones" +\
			" de los miembros."
		3:
			$Tutorial/Titulo.text = "¡Hazlo lo antes posible!"
			$Tutorial/Texto.text = "Los miembros del equipo son un poco impacientes, y se ponen " +\
			"nerviosos si tardas demasiado en entregarle las muestras. ¡Cuanto antes les entregues " +\
			"lo que piden, mejor saldrá el experimento!"

func _on_button_pressed() -> void:
	pantalla += 1
	loadPantalla()


func _on_button_2_pressed() -> void:
	pantalla -= 1
	loadPantalla()


func _on_pressed() -> void:
	arb.change_scene_to_file("res://escenas/juegoWetLabSegundo/minijuego.tscn")
