extends Node
var nivelProbeta = 0;
var liquidos: Array[String] = []
var probetas = []
var selected

func actualizarInventario():
	for i in GlobalWetGame.probetas.size():
		for e in range(0,4):
			get_node("camara/Inventario/Probeta" + str(i+1) + "/Probeta" + str(e+1)).modulate = \
				GlobalWetGame.probetas[i][e]
