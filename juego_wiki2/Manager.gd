extends Node2D
@onready var arb = get_tree()
var selected
var objetos = 0
var pagina = 1

func _process(delta: float) -> void:
	if(objetos >= 4 && pagina <= 4):
		objetos= 0
		await ocultar(get_node("Objetos/Pagina" + str(pagina)))
		get_node("Objetos/Pagina" + str(pagina)).visible=false
		print("Objetos/Pagina" + str(pagina+1))
		get_node("Objetos/Pagina" + str(pagina+1)).visible=true
		await mostrar(get_node("Objetos/Pagina" + str(pagina+1)))
		pagina +=1
		print(objetos)
	elif (objetos >= 4 && pagina == 5):
		arb.change_scene_to_file("res://escenas/SalaWiki/SalaWiki.tscn")
		

func tick(asset):#cambiar esto para solo sprites
	if(get_node("Objetos/Pagina" + str(pagina) + "/" + asset).get_class() == "Button"):
		get_node("Objetos/Pagina" + str(pagina) + "/" + asset + "/tick").visible = true
	else:
		get_node("Objetos/Pagina" + str(pagina) + "/" + asset + "/" + asset +"/tick").visible = true
	objetos += 1
	print(objetos)

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
