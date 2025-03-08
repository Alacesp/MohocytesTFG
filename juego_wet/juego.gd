extends Node2D

@onready var fondo = $Fondo
@onready var texto = $Comentario
var paso = 0
var tiempeando = false

func _ready():
	cambiar_texto("JWL1")

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and !tiempeando:
		match paso:
			0:
				if $Hielo.get_rect().has_point($Hielo.to_local(event.position)):
					cambiar_imagen($Hielo, "hielo")
					cambiar_imagen($Gradilla, "gradillaConMuchasEppendorfs")
					cambiar_texto("JWL2")
					paso += 1
			1:
				if $PipetaRoja.get_rect().has_point($PipetaRoja.to_local(event.position)):
					cambiar_texto("JWL3")
					paso += 1
			2:
				if $Gradilla.get_rect().has_point($Gradilla.to_local(event.position)):
					cambiar_imagen($Gradilla, "gradillaConEppendorfsDerecha")
					cambiar_imagen($Termobloque, "termobloqueConEppendorfs")
					await contrarreloj(10)
					cambiar_texto("JWL4")
					paso += 1
			3:
				if $Termobloque.get_rect().has_point($Termobloque.to_local(event.position)):
					cambiar_imagen($Termobloque, "termobloque")
					cambiar_imagen($Hielo, "hieloConColorines")
					cambiar_texto("JWL5")
					paso += 1
			4:
				if $Hielo.get_rect().has_point($Hielo.to_local(event.position)):
					cambiar_imagen($Hielo, "hielo")
					cambiar_imagen($Gradilla, "gradillaConEppendorfsColorines")
					cambiar_texto("JWL6")
					paso += 1
			5:
				if $PipetaRoja.get_rect().has_point($PipetaRoja.to_local(event.position)):
					cambiar_imagen($Gradilla, "gradillaConEppendorfsDerechaAmarilla")
					cambiar_texto("JWL7")
					paso += 1
			6:
				if $Gradilla.get_rect().has_point($Gradilla.to_local(event.position)):
					cambiar_imagen($Gradilla, "gradillaCon2Eppendorfs")
					cambiar_imagen($Termobloque, "termobloqueEppendorf")
					await contrarreloj(10)
					cambiar_texto("JWL8")
					paso += 1
			7:
				if $Termobloque.get_rect().has_point($Termobloque.to_local(event.position)):
					cambiar_imagen($Termobloque, "termobloque")
					cambiar_imagen($Hielo, "hieloAmarillo")
					cambiar_imagen($Gradilla, "gradillaConEppendorf")
					cambiar_texto("JWL9")
					paso += 1
			8:
				if $PipetaAmarilla.get_rect().has_point($PipetaAmarilla.to_local(event.position)):
					await contrarreloj(10)
					cambiar_imagen($Hielo, "hieloRojo")
					cambiar_texto("JWL10")
					paso += 1
			9:
				if $Termobloque.get_rect().has_point($Termobloque.to_local(event.position)):
					cambiar_imagen($Termobloque, "termobloqueEppendorfRoja")
					cambiar_imagen($Hielo, "hieloEppendorfVacia")
					await contrarreloj(3)
					cambiar_texto("JWL11")
					paso += 1
			10:
				if $Hielo.get_rect().has_point($Hielo.to_local(event.position)):
					cambiar_imagen($Termobloque, "termobloque")
					cambiar_imagen($Hielo, "hieloRojo")
					cambiar_texto("JWL12")
					paso += 1
			11:
				if $Mechero.get_rect().has_point($Mechero.to_local(event.position)):
					cambiar_imagen($Mechero, "mecheroEncendido")
					await contrarreloj(5)
					cambiar_texto("JWL13")
					paso += 1
			12:
				if $Tarro2yt.get_rect().has_point($Tarro2yt.to_local(event.position)):
					cambiar_imagen($Hielo, "hieloOscuro")
					cambiar_texto("JWL14")
					paso += 1
			13:
				if $Mechero.get_rect().has_point($Mechero.to_local(event.position)):
					cambiar_imagen($Mechero, "mecheroApagado")
					cambiar_texto("JWL15")
					paso += 1
			14:
				if $Termobloque.get_rect().has_point($Termobloque.to_local(event.position)):
					cambiar_imagen($Termobloque, "termobloqueOscuro")
					cambiar_imagen($Hielo, "hieloEppendorfVacia")
					await contrarreloj(20)
					cambiar_texto("JWL16")
					paso += 1
			15:
				if $Microcentrifuga.get_rect().has_point($Microcentrifuga.to_local(event.position)):
					cambiar_imagen($Termobloque, "termobloque")
					cambiar_imagen($Microcentrifuga, "centrifugaAbierta")
					cambiar_texto("JWL17")
					paso += 1
			16:
				if $Microcentrifuga.get_rect().has_point($Microcentrifuga.to_local(event.position)):
					cambiar_imagen($Microcentrifuga, "centrifugaActivada")
					await contrarreloj(3)
					cambiar_imagen($Microcentrifuga, "microcentrifugaCerrada")
					cambiar_texto("JWL18")
					paso += 1
			17:
				if $Microcentrifuga.get_rect().has_point($Microcentrifuga.to_local(event.position)):
					cambiar_imagen($Microcentrifuga, "centrifugaAbierta2")
					cambiar_texto("JWL19")
					paso += 1
			18:
				if $Microcentrifuga.get_rect().has_point($Microcentrifuga.to_local(event.position)):
					cambiar_imagen($Microcentrifuga, "microcentrifugaCerrada")
					$Eppendorf.visible = true
					cambiar_texto("JWL20")
					paso += 1
			19:
				if $PipetaAzul.get_rect().has_point($PipetaAzul.to_local(event.position)):
					cambiar_texto("JWL21")
					paso += 1
			20:
				if $Eppendorf.get_rect().has_point($Eppendorf.to_local(event.position)):
					cambiar_imagen($Eppendorf, "eppendorfGrande3")
					cambiar_texto("JWL22")
					paso += 1
			21:
				if $Mechero.get_rect().has_point($Mechero.to_local(event.position)):
					cambiar_imagen($Mechero, "mecheroEncendido")
					cambiar_texto("JWL23")
					paso += 1
			22:
				if $PlacaPetri.get_rect().has_point($PlacaPetri.to_local(event.position)):
					$Eppendorf.visible = false
					cambiar_imagen($PlacaPetri, "placaNueva")
					cambiar_texto("JWL24")
					paso += 1
			23:
				if $TarroLimpio.get_rect().has_point($TarroLimpio.to_local(event.position)):
					cambiar_texto("JWL25")
					paso += 1
			24:
				if $Mechero.get_rect().has_point($Mechero.to_local(event.position)):
					cambiar_imagen($Mechero, "mecheroApagado")
					cambiar_texto("JWL26")
					await get_tree().create_timer(4).timeout
					get_tree().change_scene_to_file("res://juego_wet/EndScene.tscn")

func cambiar_texto(txt):
	texto.text = tr(txt)

func contrarreloj(tiempo):
	tiempeando = true
	while tiempo != -1:
		$Reloj.text = str(tiempo) + "s"
		await get_tree().create_timer(1).timeout
		tiempo -= 1
	$Reloj.text = ""
	tiempeando = false

func cambiar_imagen(obj, img):
	obj.texture = load("res://juego_wet/Objetos/"+img+".webp")
