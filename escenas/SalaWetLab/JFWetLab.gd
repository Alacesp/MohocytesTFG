extends Sprite2D
@onready var texto: CanvasLayer = get_node("../Cuadro")

func _ready():
	if Global.wl == 0:
		texto.encolar(">SI:nada")
		texto.encolar(">SD:retratoJwlLlorando")
		texto.encolar("WL2")
		texto.encolar(">SI:retratoEsclavo5")
		texto.encolar(">CH")
		texto.encolar("WL3")
		texto.encolar(">SI:retratoEsclavo6")
		texto.encolar("WL4")
		texto.encolar(">SI:retratoPj")
	elif Global.wl == 3 and Global.jugado_wl:
		texto.encolar(">SD:1retratoJwlContenta")
		texto.encolar("WL5")
		texto.encolar("WL6")
		texto.encolar(">CH")
		texto.encolar("WL7")
		texto.encolar(">CH")
		texto.encolar(">SD:1retratoJwl")
		texto.encolar("WL8")
		texto.encolar("WL9")
		texto.encolar(">CH")
		texto.encolar("WL10")
		texto.encolar(">CH")
		texto.encolar(">SD:1retratoJwlContenta")
		texto.encolar("WL11")
		texto.encolar(">CH")
		texto.encolar("WL12")
		texto.encolar(">CH")
		texto.encolar(">SD:1retratoJwlConfiada")
		texto.encolar("WL13")
		texto.encolar(">VO")
		texto.encolar("WL14")
		texto.encolar(">VN")
		texto.encolar(">SD:1retratoJwl")
		texto.encolar("WL15")
		texto.encolar("WL16")
		await texto.esperar()
		Global.wl += 1
		Global.room += 1
		Global.salida_wl = true
		Global.salida_h = false

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and !texto.estar_activo():
			texto.encolar(">SD:retratoJwl")
			match Global.wl:
				0:
					texto.encolar(">SD:1retratoJwlLlorando")
					texto.encolar("WL17")
					texto.encolar(">VO")
					texto.encolar("WL18")
					texto.encolar("WL19")
				1:
					texto.encolar(">SD:1retratoJwlContenta")
					texto.encolar("WL20")
					texto.encolar(">VO")
					texto.encolar("WL21")
					texto.encolar("WL22")
					texto.encolar("WL23")
				2:
					texto.encolar(">SD:1retratoJwlContenta")
					texto.encolar("WL20")
					texto.encolar(">VO")
					texto.encolar("WL21")
					texto.encolar("WL22")
					texto.encolar("WL23")
				3:
					texto.encolar(">SD:1retratoJwlContenta")
					texto.encolar("WL24")
					texto.encolar(">SD:1retratoJwl")
					texto.encolar("WL25")
					texto.encolar(">SD:1retratoJwlConfiada")
					texto.encolar("WL26")
					await texto.esperar()
					Global.jugado_wl = true
					get_tree().change_scene_to_file("res://juego_wet/MainMenu.tscn")
				4:
					texto.encolar(">SD:1retratoJwlContenta")
					texto.encolar("WL27")
