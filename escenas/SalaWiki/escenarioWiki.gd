extends Sprite2D

func _process(_delta):
	if Global.jefes_visible:
		self.texture = load("res://recursos/fondos/wiki2.webp")
	else:
		self.texture = load("res://recursos/fondos/wiki1.webp")
