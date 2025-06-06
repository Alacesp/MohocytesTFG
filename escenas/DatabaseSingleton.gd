extends Node

var test_id
var ranking_id

func generate_simple_id() -> String:
	return str(Time.get_unix_time_from_system()) + "_" + str(randi())

func cargarRespuestasCuestionario(COLLECTION_ID, respuestas):
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
	await collection.add(test_id, data)

func cargarPuntuaciones(COLLECTION_ID):
	var collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_ID)
	var data: Dictionary = {
		"Drylab": Global.puntos_drylab,
		"Human": Global.puntos_human,
		"Redes": Global.puntos_redes,
		"Wetlab": Global.puntos_wetlab,
		"Wiki": Global.puntos_wiki,
		"Total": Global.puntos_drylab + Global.puntos_human + \
			Global.puntos_redes + Global.puntos_wetlab + Global.puntos_wiki
	}
	await collection.add(ranking_id, data)

func _sort_por_puntos_desc(a, b):
	if a["puntos"] > b["puntos"]:
		return true
	return false

func ranking() -> Array:
	print("Entra")
	var ranking = []
	var query : FirestoreQuery = FirestoreQuery.new().from("Puntuaciones")#.where("Total", FirestoreQuery.OPERATOR.GREATER_THAN, -10000).order_by("Total", FirestoreQuery.DIRECTION.DESCENDING)
	print("lanza la query")
	var documents = await Firebase.Firestore.query(query)
	print("resultado")

	if documents.size() == 0:
		print("No documents found.")
		return []

	for doc in documents:
		ranking.append({ "id": doc.doc_name, "puntos": doc.get("Total") })
	ranking.sort_custom(Callable(self, "_sort_por_puntos_desc"))
	return ranking
