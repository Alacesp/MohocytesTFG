extends Node2D

func _ready():
	var puntos = Global.puntos_drylab + Global.puntos_wetlab + Global.puntos_human + Global.puntos_redes + Global.puntos_wiki
	$CenterContainer/Puntos/Puntos.text = str(puntos)
