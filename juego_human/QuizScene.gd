extends Control

var resp_ind = [0, 1, 2, 3]
var preguntas = [
	{
		"enun": "JRP1",
		"opcs": ["JRP1R1", "JRP1R2", "JRP1R3", "JRP1R4"]
	},
	{
		"enun": "JRP2",
		"opcs": ["JRP2R1", "JRP2R2", "JRP2R3", "JRP2R4"]
	},
	{
		"enun": "JRP3",
		"opcs": ["JRP3R1", "JRP3R2", "JRP3R3", "JRP3R4"]
	},
	{
		"enun": "JRP4",
		"opcs": ["JRP4R1", "JRP4R2", "JRP4R3", "JRP4R4"]
	},
	{
		"enun": "JRP5",
		"opcs": ["JRP5R1", "JRP5R2", "JRP5R3", "JRP5R4"]
	},
	{
		"enun": "JRP6",
		"opcs": ["JRP6R1", "JRP6R2", "JRP6R3", "JRP6R4"]
	},
	{
		"enun": "JRP7",
		"opcs": ["JRP7R1", "JRP7R2", "JRP7R3", "JRP7R4"]
	},
	{
		"enun": "JRP8",
		"opcs": ["JRP8R1", "JRP8R2", "JRP8R3", "JRP8R4"]
	},
	{
		"enun": "JRP9",
		"opcs": ["JRP9R1", "JRP9R2", "JRP9R3", "JRP9R4"]
	},
	{
		"enun": "JRP10",
		"opcs": ["JRP10R1", "JRP10R2", "JRP10R3", "JRP10R4"]
	}
]
var pr_actual = 0

func _ready():
	mostrar_pregunta()
	$Personaje/AnimationPlayer.play("Animacion_Personaje")

func mostrar_pregunta():
	resp_ind.shuffle()
	var pregunta = preguntas[pr_actual]
	var opciones = pregunta["opcs"]
	var textura = load("res://juego_human/img_pr/"+str(pr_actual+1)+".webp")
	$Dialogo/CenterContainer/Label.text = tr(pregunta["enun"])
	$Pizarra/Diapositiva.texture = textura
	$Preguntas/HBC/Boton1/Button.text = tr(opciones[resp_ind[0]])
	$Preguntas/HBC/Boton2/Button.text = tr(opciones[resp_ind[1]])
	$Preguntas/HBC/Boton3/Button.text = tr(opciones[resp_ind[2]])
	$Preguntas/HBC/Boton4/Button.text = tr(opciones[resp_ind[3]])

func _on_press_Button1():
	dar_respuesta(0)

func _on_press_Button2():
	dar_respuesta(1)

func _on_press_Button3():
	dar_respuesta(2)

func _on_press_Button4():
	dar_respuesta(3)

func dar_respuesta(num):
	var opciones = preguntas[pr_actual]["opcs"]
	if opciones[0] == opciones[resp_ind[num]]:
		ScoreSingleton.increase_score()
	pr_actual += 1
	if pr_actual == preguntas.size():
		get_tree().change_scene_to_file("res://juego_human/EndScene.tscn")
	else:
		mostrar_pregunta()
