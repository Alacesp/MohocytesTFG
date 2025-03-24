extends Control
var COLLECTION_ID = "PreTest"
var respuestas =[]
var resp_ind = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var auth: FirebaseAuth
var rng = RandomNumberGenerator.new()
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
	respuestas.resize(9)
	auth = Firebase.Auth
	auth.login_anonymous()
	

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
		$RespuestasFormato2/HBoxContainer/Opcion1/Button8.text = tr(opciones[resp_ind[0]])
		$RespuestasFormato2/HBoxContainer/Opcion2/Button9.text = tr(opciones[resp_ind[1]])
	elif pr_actual==3:
		$RespuestasFormato6.visible= true
		$RespuestasFormato6/Label1.text = tr(opciones[resp_ind[0]])
		$RespuestasFormato6/Label2.text = tr(opciones[resp_ind[1]])
		$RespuestasFormato6/Label3.text = tr(opciones[resp_ind[2]])
		$RespuestasFormato6/Label4.text = tr(opciones[resp_ind[3]])
		$RespuestasFormato6/Label5.text = tr(opciones[resp_ind[4]])
		$RespuestasFormato6/Objeto/Label.text = tr(opciones[resp_ind[5]])
		$RespuestasFormato6/Objeto2/Label.text = tr(opciones[resp_ind[6]])
		$RespuestasFormato6/Objeto3/Label.text = tr(opciones[resp_ind[7]])
		$RespuestasFormato6/Objeto4/Label.text = tr(opciones[resp_ind[8]])
		$RespuestasFormato6/Objeto5/Label.text = tr(opciones[resp_ind[9]])
	elif pr_actual==4:
		$RespuestasFormato3.visible= true
		$RespuestasFormato3/HBoxContainer/Opcion1/Button10.text = tr(opciones[resp_ind[0]])
		$RespuestasFormato3/HBoxContainer/Opcion2/Button11.text = tr(opciones[resp_ind[1]])
		$RespuestasFormato3/HBoxContainer/Opcion3/Button12.text = tr(opciones[resp_ind[2]])
		$RespuestasFormato3/HBoxContainer/Opcion4/Button13.text = tr(opciones[resp_ind[3]])
	elif pr_actual==5 or pr_actual==6:
		$RespuestasFormato4.visible= true
		$RespuestasFormato4/HBoxContainer/Opcion1/Button15.text = tr(opciones[resp_ind[0]])
		$RespuestasFormato4/HBoxContainer/Opcion2/Button16.text = tr(opciones[resp_ind[1]])
	elif pr_actual==7:
		$RespuestasFormato7.visible= true
		$RespuestasFormato7/Objeto/Label.text = tr(opciones[resp_ind[0]])
		$RespuestasFormato7/Objeto2/Label.text = tr(opciones[resp_ind[1]])
		$RespuestasFormato7/Objeto3/Label.text = tr(opciones[resp_ind[2]])
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
		$RespuestasFormato6.visible= false
		$RespuestasFormato7.visible= false
		$Previous.visible = true
		pr_actual += 1
		mostrar_pregunta()
		print(respuestas)


func _on_button_7_pressed() -> void:
	$Finish.visible=false
	$Next.visible=true
	$RespuestasFormato2.visible= false
	$RespuestasFormato3.visible= false
	$RespuestasFormato4.visible= false
	$RespuestasFormato5.visible= false
	$RespuestasFormato6.visible= false
	$RespuestasFormato7.visible= false
	pr_actual -= 1
	mostrar_pregunta()		

#Formato 1
func _on_button_1_pressed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = tr(opciones[resp_ind[0]])


func _on_button_2_pressed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = tr(opciones[resp_ind[1]])


func _on_button_3_pressed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = tr(opciones[resp_ind[2]])


func _on_button_4_pressed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = tr(opciones[resp_ind[3]])


func _on_text_edit_op_5_focus_entered() -> void:
	respuestas[pr_actual] = $RespuestasFormato1/HBoxContainer/Opcion5/TextEdit_op5.text

#Formato 2

func _on_button_8_pressed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = tr(opciones[resp_ind[0]])


func _on_button_9_pressed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = tr(opciones[resp_ind[1]])

#Formato 3

func _on_button_10_pressed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = tr(opciones[resp_ind[0]])


func _on_button_11_pressed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = tr(opciones[resp_ind[1]])


func _on_button_12_pressed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = tr(opciones[resp_ind[2]])


func _on_button_13_pressed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = tr(opciones[resp_ind[3]])

#Formato 4

func _on_button_15_pressed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = tr(opciones[resp_ind[0]])


func _on_button_16_pressed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = tr(opciones[resp_ind[1]])


func _on_text_edit_op_3_focus_entered() -> void:
	pass # Replace with function body.

#Formato 5

func _on_text_edit_text_changed() -> void:
	var opciones = preguntas[pr_actual]["opcs"]
	respuestas[pr_actual] = $RespuestasFormato5/HBoxContainer/Opcion1/TextEdit.text

#Formato 6
#Formato 7


func _on_button_pressed() -> void:
	var collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_ID)
	var data: Dictionary = {
		"Pregunta 1": respuestas[0],
		"Pregunta 2": respuestas[1],
		"Pregunta 3": respuestas[2],
		"Pregunta 4": respuestas[3],
		"Pregunta 5": respuestas[4],
		"Pregunta 6": respuestas[5],
		"Pregunta 7": respuestas[6],
		"Pregunta 8": respuestas[7],
		"Pregunta 9": respuestas[8]
	}
	var my_random_number = rng.randf_range(0, 100000.0)
	var task: FirestoreDocument = await collection.add(str(my_random_number), data)
