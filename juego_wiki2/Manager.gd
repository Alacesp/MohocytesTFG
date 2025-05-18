extends Node2D

var selected
var pagina1 = 1

func tick(asset):
	if(pagina1 <= 8):
		if(get_node("Objetos/Pagina1/" + asset).get_class() == "Button"):
			get_node("Objetos/Pagina1/" + asset + "/tick").visible = true
		else:
			get_node("Objetos/Pagina1/" + asset + "/" + asset +"/tick").visible = true
		pagina1 += 1
	else:
		if(get_node("Objetos/Pagina2/" + asset).get_class() == "Button"):
			get_node("Objetos/Pagina2/" + asset + "/tick").visible = true
		else:
			get_node("Objetos/Pagina2/" + asset + "/" + asset +"/tick").visible = true
