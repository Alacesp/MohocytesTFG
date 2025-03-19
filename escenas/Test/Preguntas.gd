extends Control
var resp_ind = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var preguntas = [
	{
		"enun": "PREP1",
		"opcs": ["PREP1R1", "PREP1R2", "PREP1R3", "PREP1R4"]
	},
	{
		"enun": "PREP2",
		"opcs": ["PREP2R1", "PREP2R2"]
	},
	{
		"enun": "PREP3",
		"opcs": ["PREP3R1", "PREP3R2"]
	},
	{
		"enun": "PREP4",
		"opcs": ["PREP4R1", "PREP4R2", "PREP4R3", "PREP4R4", "PREP4R5", "PREP4R6", "PREP4R7", "PREP4R8", "PREP4R9", "PREP4R10"]
	},
	{
		"enun": "PREP5",
		"opcs": ["PREP5R1", "PREP5R2", "PREP5R3", "PREP5R4"]
	},
	{
		"enun": "PREP6",
		"opcs": ["PREP6R1", "PREP6R2"]
	},
	{
		"enun": "PREP7",
		"opcs": ["PREP7R1", "PREP7R2"]
	},
	{
		"enun": "PREP8",
		"opcs": ["PREP8R1", "PREP8R2", "PREP8R3"]
	},
	{
		"enun": "PREP9",
		"opcs": []
	}
]
var pr_actual = 0

func _ready():
	mostrar_pregunta()

func mostrar_pregunta():
	var pregunta = preguntas[pr_actual]
	var opciones = pregunta["opcs"]
	$Pregunta/CenterContainer/Label.text = tr(pregunta["enun"])
	if pr_actual==0:
		$Previous.visible = false
		$RespuestasFormato1.visible= true
		$RespuestasFormato1/HBoxContainer/Opcion1/Button1.text = tr(opciones[resp_ind[0]])
		$RespuestasFormato1/HBoxContainer/Opcion2/Button2.text = tr(opciones[resp_ind[1]])
		$RespuestasFormato1/HBoxContainer/Opcion3/Button3.text = tr(opciones[resp_ind[2]])
		$RespuestasFormato1/HBoxContainer/Opcion4/Button4.text = tr(opciones[resp_ind[3]])
	elif pr_actual==1 or pr_actual==2:
		$RespuestasFormato2.visible= true
		$RespuestasFormato2/HBoxContainer/Opcion1/Button1.text = tr(opciones[resp_ind[0]])
		$RespuestasFormato2/HBoxContainer/Opcion2/Button2.text = tr(opciones[resp_ind[1]])
	elif pr_actual==3:
		$RespuestasFormato6.visible= true
		#$RespuestasFormato6/Label1.text = tr(opciones[resp_ind[0]])
		#$RespuestasFormato6/Label2.text = tr(opciones[resp_ind[1]])
		#$RespuestasFormato6/Label3.text = tr(opciones[resp_ind[2]])
		#$RespuestasFormato6/Label4.text = tr(opciones[resp_ind[3]])
		#$RespuestasFormato6/Label5.text = tr(opciones[resp_ind[4]])
		#$RespuestasFormato6/objeto1/Sprite2D/Label.text = tr(opciones[resp_ind[5]])
		#$RespuestasFormato6/objeto2/Sprite2D/Label.text = tr(opciones[resp_ind[6]])
		#$RespuestasFormato6/objeto3/Sprite2D/Label.text = tr(opciones[resp_ind[7]])
		#$RespuestasFormato6/objeto4/Sprite2D/Label.text = tr(opciones[resp_ind[8]])
		#$RespuestasFormato6/objeto5/Sprite2D/Label.text = tr(opciones[resp_ind[9]])
	elif pr_actual==4:
		$RespuestasFormato3.visible= true
		$RespuestasFormato3/HBoxContainer/Opcion1/Button1.text = tr(opciones[resp_ind[0]])
		$RespuestasFormato3/HBoxContainer/Opcion2/Button2.text = tr(opciones[resp_ind[1]])
		$RespuestasFormato3/HBoxContainer/Opcion3/Button3.text = tr(opciones[resp_ind[2]])
		$RespuestasFormato3/HBoxContainer/Opcion4/Button4.text = tr(opciones[resp_ind[3]])
	elif pr_actual==5 or pr_actual==6:
		$RespuestasFormato4.visible= true
		$RespuestasFormato4/HBoxContainer/Opcion1/Button1.text = tr(opciones[resp_ind[0]])
		$RespuestasFormato4/HBoxContainer/Opcion2/Button2.text = tr(opciones[resp_ind[1]])
	elif pr_actual==8:
		$RespuestasFormato5.visible= true
		$Next.visible=false
		$Finish.visible=true


func _on_button_6_pressed() -> void:
	if pr_actual < 8:
		$RespuestasFormato1.visible= false
		$RespuestasFormato2.visible= false
		$RespuestasFormato3.visible= false
		$RespuestasFormato4.visible= false
		$Previous.visible = true
		pr_actual += 1
		mostrar_pregunta()


func _on_button_7_pressed() -> void:
	$Finish.visible=false
	$Next.visible=true
	$RespuestasFormato2.visible= false
	$RespuestasFormato3.visible= false
	$RespuestasFormato4.visible= false
	$RespuestasFormato5.visible= false
	pr_actual -= 1
	mostrar_pregunta()		
