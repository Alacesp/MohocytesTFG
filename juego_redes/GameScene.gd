extends Sprite2D

@onready var completa = $Completa
@onready var interactuable = $Interactuable
@onready var guia = $Contenedor/Guia
@onready var objetos = $Objetos.get_children()

func _ready():
	sig_nivel()

func sig_nivel():
	if TranslationServer.get_locale() == "en":
		completa.texture = load("res://juego_redes/Completas/I"+str(GameGlobal.nivel)+".webp")
		interactuable.texture = load("res://juego_redes/Interactuable/I"+str(GameGlobal.nivel)+".webp")
		if completa.texture == null:
			completa.texture = load("res://juego_redes/Completas/"+str(GameGlobal.nivel)+".webp")
		if interactuable.texture == null:
			interactuable.texture = load("res://juego_redes/Interactuable/"+str(GameGlobal.nivel)+".webp")
	else:
		completa.texture = load("res://juego_redes/Completas/"+str(GameGlobal.nivel)+".webp")
		interactuable.texture = load("res://juego_redes/Interactuable/"+str(GameGlobal.nivel)+".webp")

	set_memo()
	await contrarreloj(3)
	set_interactivo()
	GameGlobal.interactuable = true
	await contrarreloj(10)
	GameGlobal.interactuable = false
	ver_diferencia()
	await contrarreloj(3)
	if GameGlobal.nivel < 6:
		GameGlobal.nivel += 1
		sig_nivel()
	else:
		get_tree().change_scene_to_file("res://juego_redes/EndScene.tscn")

func set_memo():
	for objeto in objetos:
		objeto.resetear()
	completa.modulate.a = 1
	guia.text = tr("JR1")

func set_interactivo():
	completa.modulate.a = 0
	guia.text = tr("JR2")
	for objeto in objetos:
		objeto.actualizar_propiedades()

func ver_diferencia():
	guia.text = tr("JR3")
	completa.modulate.a = 0.5
	for objeto in objetos:
		GameGlobal.score += objeto.score

func contrarreloj(tiempo):
	while tiempo > -1:
		if tiempo < 10:
			$Tiempo.text = "00:0" + str(tiempo)
		else:
			$Tiempo.text = "00:" + str(tiempo)
		tiempo -= 1
		await get_tree().create_timer(1).timeout
