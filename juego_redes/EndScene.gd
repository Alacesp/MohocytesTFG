extends Control

func _ready():
	$CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/Puntos.text = str(GameGlobal.score)
	Global.puntos_redes = GameGlobal.score
