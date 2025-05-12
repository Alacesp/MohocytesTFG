extends Control

var respuestas = ["Sin responder", "Sin responder", "Sin responder", \
	"Sin responder", "Sin responder", "Sin responder", "Sin responder", "Sin responder", "Sin responder"]
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

var result_8

func _ready() -> void:
	cargarPreguntas()
	DatabaseSingleton.ranking_id = DatabaseSingleton.generate_simple_id()
	DatabaseSingleton.test_id = DatabaseSingleton.generate_simple_id()

func cargarPreguntas():
	var pregunta 
	var opciones 
	for i in range (0,9):
		pregunta = preguntas[i]
		opciones = pregunta["opcs"]
		get_node("Pregunta"+ str(i+1) +"/Pregunta/CenterContainer/Label").text = tr(pregunta["enun"])
		if (i!=3 and i!=7):
			for e in opciones.size():
				get_node("Pregunta"+ str(i+1) +"/RespuestasPregunta"+ str(i+1) \
					+"/HBoxContainer/Opcion"+ str(e+1) +"/Button").text =  tr(opciones[e])
		elif (i==3):
			for e in range(0,5):
				for u in range(0,5):
					get_node("Pregunta"+ str(i+1) +"/OptionButton" + str(e+1)).add_item(tr(opciones[u]))
			for e in range(5,10):
				get_node("Pregunta"+ str(i+1) +"/Label" + str(e-4)).text = tr(opciones[e])
		elif (i==7):
			for e in range(0,3):
				get_node("Pregunta"+ str(i+1) +"/Label" + str(e+1)).text = tr(opciones[e])


func corregirDesplegables4():
	var result_4 = 0
	if(get_node("Pregunta4/OptionButton1").selected == 2):
		result_4 +=1
	if(get_node("Pregunta4/OptionButton2").selected == 0):
		result_4 +=1
	if(get_node("Pregunta4/OptionButton3").selected == 4):
		result_4 +=1
	if(get_node("Pregunta4/OptionButton4").selected == 1):
		result_4 +=1
	if(get_node("Pregunta4/OptionButton5").selected == 3):
		result_4 +=1
	return result_4
	
func corregirDesplegables8():
	var result_8 = 0
	if(get_node("Pregunta8/OptionButton1").selected == 2):
		result_8 +=1
	if(get_node("Pregunta8/OptionButton2").selected == 0):
		result_8 +=1
	if(get_node("Pregunta8/OptionButton3").selected == 1):
		result_8 +=1
		
	return result_8

func _on_button_pressed_acabar() -> void:
	respuestas[3] = corregirDesplegables4()
	respuestas[7] = corregirDesplegables8()
	if(Global.preTest):
		DatabaseSingleton.cargarRespuestasCuestionario("PreTest", respuestas)
		Global.preTest = false
	else:
		DatabaseSingleton.cargarRespuestasCuestionario("PostTest", respuestas)
