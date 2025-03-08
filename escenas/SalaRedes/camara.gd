extends Sprite2D

func _process(_delta):
	if Global.visible_jwl:
		self.texture = load("res://recursos/fondos/camara2.webp")
	else:
		self.texture = load("res://recursos/fondos/camara.webp")
