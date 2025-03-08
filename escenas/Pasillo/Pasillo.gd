extends Sprite2D

@onready var musica = get_node('../Personaje/Musica')

func _ready():
	self.visible = Global.visible_pasillo
	if Global.room == 7:
		musica.stream = load("res://recursos/audios/the_end-an_igem_uma_original_theme.ogg")
		musica.play()
