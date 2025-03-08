extends Control

@onready var arb = get_tree()

func _ready():
	var score = ScoreSingleton.score
	Global.puntos_human = 240 - 40 * (10 - score)
	if score < 5:
		$CenterContainer/Label.text = tr("JHFM")
	else:
		$CenterContainer/Label.text = tr("JHFB") + " " + str(score) + " " + tr("JHFB2")
	$Salir/Button.text = "Volver"
	$Salir/Button.connect("pressed", volver)

func volver():
	arb.change_scene_to_file("res://escenas/SalaHuman/SalaHuman.tscn")
