extends Control

var tiempo = 60
var nivel = 0
var imagen = 0
var imagenes = [0,1,2,3,4,5]
var fuente = [0,0,0,0]
var fuentes = [0,1,2,3]
var textos = [1,2,3,4,5,6]
var estado = [0,0,0,0,0]
var labels = []

func _ready():
	var label1 = LabelSettings.new()
	label1.font = load("res://recursos/Letters_for_Learners.ttf")
	label1.font_size = 18
	labels.push_back(label1)
	var label2 = LabelSettings.new()
	label2.font = load("res://recursos/Nanicha.ttf")
	label2.font_size = 10
	labels.push_back(label2)
	var label3 = LabelSettings.new()
	label3.font = load("res://juego_wiki/comic-sans.ttf")
	label3.font_size = 13
	labels.push_back(label3)
	var label4 = LabelSettings.new()
	label4.font = load("res://juego_wiki/arial.ttf")
	label4.font_size = 15
	labels.push_back(label4)
	$Imagen/Bot.connect("pressed", clicI)
	$Textos/Texto1.connect("pressed", clic1)
	$Textos/Texto1/Label.label_settings = label1
	$Textos/Texto2.connect("pressed", clic2)
	$Textos/Texto2/Label.label_settings = label2
	$Textos/Texto3.connect("pressed", clic3)
	$Textos/Texto3/Label.label_settings = label3
	$Textos/Texto4.connect("pressed", clic4)
	$Textos/Texto4/Label.label_settings = label4
	montar_nivel()
	poner_cuenta_atras()

func poner_cuenta_atras():
	while tiempo >= 0:
		$Tiempo.text = str(tiempo)+"s"
		await get_tree().create_timer(1).timeout
		tiempo -= 1
	Global.puntos_wiki = 240 - 40 * (6-(nivel+1))
	terminar()

func montar_nivel():
	textos.shuffle()
	imagenes.shuffle()
	fuentes.shuffle()
	set_guia()
	random_image()
	random_font($Textos/Texto1/Label, 0)
	$Textos/Texto1/Label.text = tr("WT"+str(textos[0]))
	random_font($Textos/Texto2/Label, 1)
	$Textos/Texto2/Label.text = tr("WT"+str(textos[1]))
	if nivel == 2:
		$Textos/Texto3.flat = false
		random_font($Textos/Texto3/Label, 2)
		$Textos/Texto3/Label.text = tr("WT"+str(textos[2]))
	elif nivel == 4:
		$Textos/Texto4.flat = false
		random_font($Textos/Texto4/Label, 3)
		$Textos/Texto4/Label.text = tr("WT"+str(textos[3]))

func set_guia():
	$Intr/Img/Texto.text = tr("WP"+str(imagenes[0]+1))
	$Intr/Font/Texto.text = tr("WF"+str(fuentes[0]+1))

func random_image():
	imagen = randi_range(0, 5)
	while imagen == imagenes[0]:
		imagen = randi_range(0, 5)
	$Imagen.texture = load("res://juego_wiki/Fotos/"+str(imagen)+".jpg")

func random_font(label, n):
	fuente[n] = randi_range(0, 3)
	while fuente[n] == fuentes[0]:
		fuente[n] = randi_range(0, 3)
	label.label_settings = labels[fuente[n]]

func comprobar():
	if imagen != imagenes[0]:
		return
	if fuente[0] != fuentes[0]:
		return
	if fuente[1] != fuentes[0]:
		return
	if nivel >= 2 and fuente[2] != fuentes[0]:
		return
	if nivel >= 4 and fuente[3] != fuentes[0]:
		return
	imagenes.pop_front()
	nivel += 1
	if nivel >= 6:
		Global.puntos_wiki = 240
		terminar()
	else:
		montar_nivel()

func terminar():
	get_tree().change_scene_to_file("res://juego_wiki/EndScene.tscn")

func clicI():
	imagen = (imagen + 1) % 6
	$Imagen.texture = load("res://juego_wiki/Fotos/"+str(imagen)+".jpg")
	comprobar()

func clic1():
	fuente[0] = (fuente[0] + 1) % 4
	$Textos/Texto1/Label.label_settings = labels[fuente[0]]
	comprobar()

func clic2():
	fuente[1] = (fuente[1] + 1) % 4
	$Textos/Texto2/Label.label_settings = labels[fuente[1]]
	comprobar()

func clic3():
	if nivel < 2:
		return
	fuente[2] = (fuente[2] + 1) % 4
	$Textos/Texto3/Label.label_settings = labels[fuente[2]]
	comprobar()

func clic4():
	if nivel < 4:
		return
	fuente[3] = (fuente[3] + 1) % 4
	$Textos/Texto4/Label.label_settings = labels[fuente[3]]
	comprobar()
