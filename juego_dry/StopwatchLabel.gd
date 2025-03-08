extends Label

var minutos = 1
var segundos = 0

func _process(_delta):
	minutos = Score.remaining_time / 60
	segundos = Score.remaining_time % 60
	if segundos < 10:
		text = str(minutos) + ":0" + str(segundos)
	else:
		text = str(minutos) + ":" + str(segundos)
