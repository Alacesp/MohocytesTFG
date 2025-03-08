extends Sprite2D
@onready var texto: CanvasLayer = get_node("../Cuadro")

func _ready():
	if Global.dl == 5 and Global.jugado_dl:
		texto.encolar(">SD:1retratoJdlPensando")
		texto.encolar("DL1")
		texto.encolar(">SD:1retratoJdlSonriente")
		texto.encolar("DL2")
		texto.encolar(">CH")
		texto.encolar("DL3")
		texto.encolar(">CH")
		texto.encolar("DL4")
		texto.encolar(">SD:1retratoJdl")
		texto.encolar("DL5")
		texto.encolar(">CH")
		texto.encolar("DL6")
		await texto.esperar()
		Global.dl += 1
		Global.room += 1
		Global.salida_dl = true

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and !texto.estar_activo():
			texto.encolar(">SI:retratoPj")
			texto.encolar(">SD:retratoJdl")
			match Global.dl:  
				0:
					texto.encolar(">CH")
					texto.encolar("DL7")
					texto.encolar(">CH")
					texto.encolar("DL8")
					texto.encolar(">VO")
					texto.encolar("DL9")
				1:
					texto.encolar(">SD:1retratoJdlJuzgandote")
					texto.encolar("DL10")
				2:	
					texto.encolar("DL11")
					texto.encolar("DL12")
					texto.encolar(">SD:1retratoJdlPensando")
					texto.encolar("DL13")
					texto.encolar(">VO")
					texto.encolar("DL14")
					texto.encolar(">VN")
					texto.encolar(">SD:1retratoJdlJuzgandote")
					texto.encolar("DL15")
					texto.encolar(">CH")
					texto.encolar("DL16")
					texto.encolar(">CH")
					texto.encolar(">SD:1retratoJdl")
					texto.encolar("DL17")
					texto.encolar(">CH")
					texto.encolar("DL18")
					texto.encolar(">CH")
					texto.encolar("DL19")
					texto.encolar(">CH")
					texto.encolar("DL20")
					texto.encolar("DL21")
					texto.encolar(">CH")
					texto.encolar(">SD:1retratoJdlJuzgandote")
					texto.encolar("DL22")
					texto.encolar(">SD:1retratoJdlPensando")
					texto.encolar("DL23")
					texto.encolar(">SD:1retratoJdl")
					texto.encolar("DL24")
					texto.encolar("DL25")
					texto.encolar(">SD:1retratoJdlPensando")
					texto.encolar("DL26")
					texto.encolar("DL27")
					texto.encolar(">SD:1retratoJdlSonriente")
					texto.encolar("DL28")
					texto.encolar(">CH")
					texto.encolar("DL29")
					texto.encolar("DL30")
					texto.encolar(">CH")
					texto.encolar(">SD:1retratoJdlJuzgandote")
					texto.encolar("DL31")
					texto.encolar("DL32")
					texto.encolar("DL33")
					Global.dl += 1
				3:
					texto.encolar("DL34")
				4:
					texto.encolar("DL35")
				5:
					texto.encolar(">SD:1retratoJdlJuzgandote")
					texto.encolar("DL36")
					texto.encolar(">SD:1retratoJdlSonriente")
					texto.encolar("DL37")
					await texto.esperar()
					Global.jugado_dl = true
					get_tree().change_scene_to_file("res://juego_dry/MainMenu.tscn")
				6:
					texto.encolar(">SD:1retratoJdlSonriente")
					texto.encolar("DL38")
