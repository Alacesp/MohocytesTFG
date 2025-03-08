extends Sprite2D

var carro_actual = 0

func _process(_delta):
	if carro_actual != Score.secuencia:
		carro_actual = Score.secuencia
		texture = load("res://juego_dry/Carro/Carro" + str(Score.secuencia) + ".webp")
