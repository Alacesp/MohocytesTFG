extends Node2D
var respuesta = []
var puntos

func _process(delta: float) -> void:
	if !respuesta.is_empty():
		$CenterContainer/Puntos/Puntos.text = str(puntos)
		$Resultados/Primero.text = str(respuesta[0])
		$Resultados/Segundo.text = str(respuesta[1])
		$Resultados/Tercero.text = str(respuesta[2])
		$Resultados/Cuarto.text = str(respuesta[3])
		$Resultados/Quinto.text = str(respuesta[4])
		$Resultados/Posicion.text = str(respuesta[5])
		$Resultados/Total.text = str(respuesta[6])
		$cargando.visible = false
		$Resultados.visible = true
		$CenterContainer.visible = true
		$Iniciar.visible = true

func _ready():
	puntos = Global.puntos_drylab + Global.puntos_wetlab + Global.puntos_human + Global.puntos_redes + Global.puntos_wiki
	#DatabaseSingleton.ranking_id = "1749382852.445_1910675598"
	respuesta = await returnRanking(DatabaseSingleton.ranking_id)
	print(str(respuesta))
	

func returnRanking(id:String) -> Array:
	var values = []
	var pos = 0
	var ranking = await DatabaseSingleton.ranking()
	
	for i in range(5):
		values.append(ranking[i]["puntos"])
	
	for entry in ranking:
		pos += 1
		if entry["id"] == id:
			values.append(pos)
			values.append(ranking.size())
			break
	
	return values
