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
