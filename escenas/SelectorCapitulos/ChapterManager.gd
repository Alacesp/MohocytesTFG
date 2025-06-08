extends Node2D
@onready var arb = get_tree()

func _on_button_human_pressed() -> void:
	Global.fullGame = false
	Global.prologo = false
	Global.visible_pasillo = true
	Global.puerta = 1
	arb.change_scene_to_file("res://escenas/SalaHuman/SalaHuman.tscn")


func _on_button_drylab_pressed() -> void:
	Global.fullGame = false
	Global.prologo = false
	Global.visible_pasillo = true
	Global.human = 1
	Global.room = 2
	Global.salida_h = true
	Global.puerta = 2
	arb.change_scene_to_file("res://escenas/SalaDryLab/SalaDryLab.tscn")


func _on_button_wet_pressed() -> void:
	Global.fullGame = false
	Global.prologo = false
	Global.visible_pasillo = true
	Global.human = 1
	Global.room = 3
	Global.salida_h = true
	Global.dl = 6
	Global.salida_dl = true
	Global.jugado_dl = true
	Global.puerta = 3
	arb.change_scene_to_file("res://escenas/SalaWetLab/SalaWetLab.tscn")


func _on_button_redes_pressed() -> void:
	Global.fullGame = false
	Global.prologo = false
	Global.visible_pasillo = true
	Global.human = 3
	Global.room = 5
	Global.salida_h = true
	Global.dl = 6
	Global.salida_dl = true
	Global.jugado_dl = true
	Global.wl = 4
	Global.jugado_wl = true
	Global.salida_wl = true
	Global.jugado_h = true
	Global.puerta = 4
	arb.change_scene_to_file("res://escenas/SalaRedes/SalaRedes.tscn")


func _on_button_wiki_pressed() -> void:
	Global.fullGame = false
	Global.prologo = false
	Global.visible_pasillo = true
	Global.human = 3
	Global.room = 6
	Global.salida_h = true
	Global.dl = 6
	Global.salida_dl = true
	Global.jugado_dl = true
	Global.wl = 4
	Global.jugado_wl = true
	Global.salida_wl = true
	Global.jugado_h = true
	Global.puerta = 5
	Global.redes = 4
	Global.jugado_r = true
	arb.change_scene_to_file("res://escenas/SalaWiki/SalaWiki.tscn")
