extends Control

var respuestas = [0,0,0,0,0,0,0,0,""]
var result_4
var result_8

#func _ready() -> void:
	#Global.preTest = false
	#Global.pretestAnswer = ["borrarPre",0,0,0,0,0,0,0,""]
	#Global.puntos_drylab = 1
	#Global.puntos_wetlab = 1
	#Global.puntos_human = 1
	#Global.puntos_redes = 1
	#Global.puntos_wiki = 1
	#DatabaseSingleton.test_id = DatabaseSingleton.generate_simple_id()
	#DatabaseSingleton.ranking_id = DatabaseSingleton.generate_simple_id()

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
		DatabaseSingleton.ranking_id = DatabaseSingleton.generate_simple_id()
		DatabaseSingleton.test_id = DatabaseSingleton.generate_simple_id()
		Global.pretestAnswer = respuestas
		Global.preTest = false
		get_tree().change_scene_to_file("res://escenas/Pasillo/Pasillo.tscn")
	else:
		await DatabaseSingleton.cargarRespuestasCuestionario("PreTest", Global.pretestAnswer)
		await DatabaseSingleton.cargarRespuestasCuestionario("PostTest", respuestas)
		await DatabaseSingleton.cargarPuntuaciones()
		get_tree().change_scene_to_file("res://escenas/Fin/Fin.tscn")
