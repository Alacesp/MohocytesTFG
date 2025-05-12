extends Control

@onready var arb = get_tree()

func _ready():
	var score = GlobalWetGame.puntuacion
	Global.puntos_wetlab = score
	$CenterContainer/Label.text = "¡Conseguiste " + str(score) + " puntos!"
	$Salir/Button.text = "Volver"
	$Salir/Button.connect("pressed", volver)

func volver():
	arb.change_scene_to_file("res://escenas/SalaWetLab/SalaWetLab.tscn")
