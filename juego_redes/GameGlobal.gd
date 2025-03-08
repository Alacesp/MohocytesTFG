extends Node

var nivel = 0
var interactuable = false
var score = 0

var objetos_por_nivel = [
	[
		{"img": "Bacteria", "pos": Vector2(2, -115)},
		{"img": "Titulo", "pos": Vector2(3, 80)},
	],
	[
		{"img": "GloboComentario", "pos": Vector2(-79, 18)},
		{"img": "GloboPensativo", "pos": Vector2(130, 5)},
	],
	[
		{"img": "Bacteria", "pos": Vector2(48, 166)},
		{"img": "Input", "pos": Vector2(-98, 176)},
		{"img": "Output", "pos": Vector2(180, 176)},
	],
	[
		{"img": "ADN", "pos": Vector2(-2, 111)},
		{"img": "Bacteria", "pos": Vector2(-135, 109)},
		{"img": "Fluorescente", "pos": Vector2(126, 119)},
		{"img": "GloboComentario", "pos": Vector2(-2, 54)},
	],
	[
		{"img": "BocadilloGrande", "pos": Vector2(-135, -41)},
		{"img": "BocadilloPequeño", "pos": Vector2(142, 20)},
		{"img": "Manzana", "pos": Vector2(-163, 123)},
		{"img": "Planta", "pos": Vector2(190, 189)},
		{"img": "Tirita", "pos": Vector2(41, -73)},
	],
	[
		{"img": "ADN", "pos": Vector2(-174, -40)},
		{"img": "Bacteria", "pos": Vector2(172, -43)},
		{"img": "Colaboración", "pos": Vector2(-3, 178)},
		{"img": "Education", "pos": Vector2(196, 101)},
		{"img": "iGEMlogo", "pos": Vector2(2, -161)},
		{"img": "Inclusivity", "pos": Vector2(-171, 95)},
	],
	[
		{"img": "Bacterias", "pos": Vector2(178, 28)},
		{"img": "Engranaje", "pos": Vector2(193, -193)},
		{"img": "Iconos", "pos": Vector2(0, -42)},
		{"img": "Lupa", "pos": Vector2(-168, 163)},
		{"img": "Sorpresa", "pos": Vector2(-101, 34)},
		{"img": "Texto", "pos": Vector2(0, 145)},
	]
]

func get_imagen(num):
	if num >= objetos_por_nivel[nivel].size():
		return null
	return objetos_por_nivel[nivel][num]["img"]

func get_pos_correcta(num):
	if num >= objetos_por_nivel[nivel].size():
		return null
	return objetos_por_nivel[nivel][num]["pos"]
