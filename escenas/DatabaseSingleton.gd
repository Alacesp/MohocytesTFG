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
	var task: FirestoreDocument = await collection.add(test_id, data)



#func obtenerRanking() -> Array:
	#var collection = Firebase.Firestore.collection("Puntuaciones")
	#for i in collection.size():
		#print("a")
	#var results = await collection.get_doc("1748413928.52_4251288011")
	#var ranking = []
	#var total = 0
	#for key in results.keys():
		#total += int(results[key])
	#ranking.append({"puntos": total})
	##for doc in results.documents:
		##var data = doc.data
		##var total = 0
		##for key in data.keys():
			##total += int(data[key])
		##ranking.append({"nombre": doc.id, "puntos": total})
	##ranking.sort_custom(Callable(self, "_sort_por_puntos_desc"))
	#return ranking
#
#func _sort_por_puntos_desc(a, b):
	#return b["puntos"] - a["puntos"]
	#
#func get_document_ids(collection_name: String) -> void:
	#var query: FirestoreQuery = FirestoreQuery.new()
	#query.from(collection_name)
#
	#var documents = await Firebase.Firestore.query(query)
#
	#if documents.size() == 0:
		#print("No documents found.")
		#return
#
	#for doc in documents:
		#print("Document ID:", doc.doc_name)



func obtenerRanking() -> Array:
	var collection = Firebase.Firestore.collection("Puntuaciones")
	var ranking = []
	var ids = await get_document_ids("Puntuaciones")
	for id in ids:
		await addAlRanking(id, ranking)
	ranking.sort_custom(Callable(self, "_sort_por_puntos_desc"))
	return ranking
	
func addAlRanking(id, ranking)->Array:
	var collection = Firebase.Firestore.collection("Puntuaciones")
	var results = await collection.get_doc(id)
	var total = 0
	for key in results.keys():
		total += int(results[key])
	ranking.append({ "id": id, "puntos": total})
	return ranking

func _sort_por_puntos_desc(a, b):
	return b["puntos"] - a["puntos"]
	
func get_document_ids(collection_name: String) -> Array:
	var ids = []
	var query: FirestoreQuery = FirestoreQuery.new()
	query.from(collection_name)

	var documents = await Firebase.Firestore.query(query)

	if documents.size() == 0:
		print("No documents found.")
		return []

	for doc in documents:
		ids.append(doc.doc_name)
	return ids
