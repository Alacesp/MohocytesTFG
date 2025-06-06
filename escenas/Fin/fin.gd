extends Node2D

func _ready():
	var puntos = Global.puntos_drylab + Global.puntos_wetlab + Global.puntos_human + Global.puntos_redes + Global.puntos_wiki
	
	
	var respuesta = await returnRanking("1748417697.314_3681005533")
	print(str(respuesta))
	$CenterContainer/Puntos/Puntos.text = str(puntos)
	$Puntos2.text = str(respuesta[0])
	$Puntos3.text = str(respuesta[1])
	$Puntos4.text = str(respuesta[2])
	$Puntos5.text = str(respuesta[3])
	$Puntos6.text = str(respuesta[4])
	$Puntos7.text = str(respuesta[5])
	$Puntos8.text = str(respuesta[6])

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
