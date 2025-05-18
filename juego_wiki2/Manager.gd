extends Node2D

var selected
var pagina1 = 1

func _process(delta: float) -> void:
	if(pagina1 >= 9):
		await ocultar($Objetos/Pagina1)
		$Objetos/Pagina1.visible=false
		$Objetos/Pagina2.visible=true
		await mostrar($Objetos/Pagina2)

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

func ocultar(pagina):
	var children = pagina.get_children()
	for i in children:
		i.visible = false
		await get_tree().create_timer(0.1).timeout
		
func mostrar(pagina):
	var children = pagina.get_children()
	for i in children:
		i.visible = true
		await get_tree().create_timer(0.1).timeout
