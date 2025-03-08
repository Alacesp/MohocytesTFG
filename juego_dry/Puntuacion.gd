extends Label

func _process(_delta):
	text = str(Score.points * 10)
