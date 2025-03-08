extends Sprite2D

var sec_actual = 0

func _process(_delta):
	if sec_actual != Score.secuencia_obs:
		sec_actual = Score.secuencia_obs
		texture = load("res://juego_dry/Marcadores/Marcador" + str(Score.secuencia_obs) + ".webp")
