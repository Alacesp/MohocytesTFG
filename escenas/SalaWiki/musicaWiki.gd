extends AudioStreamPlayer2D

func _ready():
	if Global.jefes_visible:
		self.stream = load("res://recursos/audios/the_end-an_igem_uma_original_theme.ogg")
	else:
		self.stream = load("res://recursos/audios/inicio-an_igem_uma_original_theme.ogg")
	self.play()
