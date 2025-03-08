extends Button

func _ready():
	TranslationServer.set_locale("en")
	get_parent().texture = load("res://recursos/idioma2.webp")

func _on_pressed():
	if TranslationServer.get_locale() == "en":
		TranslationServer.set_locale("es")
		get_parent().texture = load("res://recursos/idioma1.webp")
	else:
		TranslationServer.set_locale("en")
		get_parent().texture = load("res://recursos/idioma2.webp")

func _on_mouse_entered():
	get_parent().modulate.a = 0.85

func _on_mouse_exited():
	get_parent().modulate.a = 1

func _on_button_down():
	get_parent().modulate.a = 0.7

func _on_button_up():
	get_parent().modulate.a = 0.85
