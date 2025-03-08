extends Sprite2D

@onready var texto: CanvasLayer = get_node("../Cuadro")

func _ready():
	if Global.redes == 0:
		texto.encolar(">CH")
		texto.encolar("R1")
		texto.encolar(">SD:retratoJrContenta")
		texto.encolar(">CH")
		texto.encolar("R2")
		texto.encolar("R3")
		texto.encolar("R4")
		texto.encolar(">CH")
		texto.encolar("R5")
		texto.encolar(">CH")
		texto.encolar(">SD:1retratoJrSorprendida")
		texto.encolar("R6")
		texto.encolar(">VO")
		texto.encolar(">SD:1retratoJr")
		texto.encolar("R7")
		texto.encolar(">VN")
		texto.encolar(">CH")
		texto.encolar("R8")
		texto.encolar(">CH")
		texto.encolar(">SD:1retratoJrContenta")
		texto.encolar("R9")
		texto.encolar(">SD:1retratoJr")
		texto.encolar("R10")
		texto.encolar("R11")
		Global.redes += 1

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and !texto.estar_activo():
			print(Global.redes)
			texto.encolar(">SD:retratoJr")
			if Global.redes < 3:
				texto.encolar(">SD:1retratoJrContenta")
				texto.encolar("H12")
				print("A")
			elif Global.redes <= 4:
				if Global.redes == 3:
					Global.redes = 4
				texto.encolar("R13")
				texto.encolar("R14")
				texto.encolar(">CH")
				texto.encolar("R15")
				texto.encolar("R16")
				texto.encolar(">VO")
				texto.encolar("R17")
				texto.encolar(">CH")
				texto.encolar(">VN")
				texto.encolar(">SD:1retratoJrSorprendida")
				texto.encolar("R18")
				texto.encolar(">CH")
				texto.encolar("R19")
				await texto.esperar()
				print("B")
				Global.visible_jwl = true
				texto.encolar(">SD:retratoJwlContenta")
				texto.encolar("R20")
				texto.encolar(">CH")
				texto.encolar("R21")
				texto.encolar(">CH")
				texto.encolar("R22")
				texto.encolar(">VO")
				texto.encolar("R23")
				texto.encolar(">VN")
				texto.encolar(">SD:1retratoJwlConfiada")
				texto.encolar("R24")
				texto.encolar(">SD:1retratoJwlShock")
				texto.encolar("R25")
				texto.encolar(">CH")
				texto.encolar("R26")
				texto.encolar(">CH")
				texto.encolar(">SD:1retratoJwlLlorando")
				texto.encolar("R27")
				texto.encolar(">SD:1retratoJwlConfiada")
				texto.encolar("R28")
				await texto.esperar()
				Global.redes += 1
				Global.room += 1
				Global.salida_redes = true
			elif Global.redes == 4:
				print("C")
				texto.encolar("R29")
				texto.encolar("R30")
