extends CanvasLayer

@onready var difuminado: Panel = $Difuminado
@onready var sprite_izq = $SpriteIzq
@onready var sprite_der = $SpriteDer
@onready var bocadillo = $Bocadillo
@onready var bocadillo_off = $BocadilloOff
@onready var texto = $Texto
@onready var next = $Next
@onready var opc1 = $Opcion_1
@onready var opc2 = $Opcion_2

enum Estado {
	ESPERANDO,
	LEYENDO,
	TERMINADO,
}

var tiempo_parpadeo = 0.5
@onready var parpadeo: SceneTreeTimer = get_tree().create_timer(tiempo_parpadeo)
var estado = Estado.ESPERANDO
var activo = false
var mantenido = false
var x_der = 909
var x_izq = 258
var text_der = "nada"
var text_izq = "retratoPj"
@onready var tween
@onready var reproductor = $AudioStreamPlayer2D
var cola = []

func _ready():
	estado = Estado.ESPERANDO
	texto.text = ""
	next.text = ""
	esconder()

func _process(_delta):
	match estado:
		Estado.ESPERANDO:
			if !cola.is_empty():
				var sig = cola.pop_front()
				if sig.substr(0, 1) == ">":
					ejecutar(sig.substr(1))
				else:
					next.text = ""
					decir(sig)
			elif activo:
				if !mantenido:
					esconder()
				activo = false
		Estado.LEYENDO:
			if Input.is_action_just_pressed("ui_accept"):
				tween.stop() 
				texto.visible_ratio = 1
				next.text = "^"
				estado = Estado.TERMINADO
		Estado.TERMINADO:
			if parpadeo.time_left == 0:
				if next.text == "^":
					next.text = ""
					parpadeo = get_tree().create_timer(tiempo_parpadeo*0.5)
				else:
					next.text = "^"
					parpadeo = get_tree().create_timer(tiempo_parpadeo)
			if Input.is_action_just_pressed("ui_accept"):
				cerrar_opcs()
				$Esquema.visible = false
				estado = Estado.ESPERANDO
			elif Input.is_key_pressed(KEY_UP):
				marca_opc1()
				Global.resp = true
			elif Input.is_key_pressed(KEY_DOWN):
				marca_opc2()
				Global.resp = false

func esperar():
	while activo:
		await get_tree().create_timer(0.01).timeout

func ejecutar(ac):
	match ac.substr(0,2):
		"ES":
			poner_esquema(ac.substr(3))
		"SD":
			if ac.substr(3,1) == "1":
				cambiar_sprite_derecho(ac.substr(4), false)
			else:
				cambiar_sprite_derecho(ac.substr(3), true)
		"SI":
			if ac.substr(3,4) == "1":
				cambiar_sprite_izquierdo(ac.substr(4), false)
			else:
				cambiar_sprite_izquierdo(ac.substr(3), true)
		"VO":
			cambiar_a_off()
		"VN":
			cambiar_a_on()
		"CH":
			cambiar_hablante()
		"PR":
			hacer_pregunta()
		"MN":
			mantenido = true
		_:
			print("Función no reconocida")

func poner_esquema(esq):
	$Esquema.texture = load("res://recursos/img_conv/"+esq+".webp")
	$Esquema.visible = true
	estado = Estado.TERMINADO

func hacer_pregunta():
	estado = Estado.TERMINADO
	opc1.visible = true
	opc2.visible = true
	if Global.resp:
		marca_opc1()
	else:
		marca_opc2()

func marca_opc1():
	opc1.modulate = Color(1,1,1,1)
	opc2.modulate = Color(0.5,0.5,0.5,1)

func marca_opc2():
	opc1.modulate = Color(0.5,0.5,0.5,1)
	opc2.modulate = Color(1,1,1,1)

func cerrar_opcs():
	opc1.visible = false
	opc2.visible = false

func cambiar_hablante():
	bocadillo.flip_h = !bocadillo.flip_h

func cambiar_a_off():
	bocadillo.visible = false
	bocadillo_off.visible = true

func cambiar_a_on():
	bocadillo.visible = true
	bocadillo_off.visible = false

func cambiar_sprite_derecho(spr, animado):
	text_der = spr
	sprite_der.texture = load("res://recursos/personajes/"+spr+".webp")
	if animado:
		sprite_der.position.x = x_der + 100
		tween = get_tree().create_tween()
		tween.tween_property(sprite_der, "position", Vector2(x_der, sprite_der.position.y), 0.3)
		await tween.finished

func cambiar_sprite_izquierdo(spr, animado):
	text_izq = spr
	sprite_izq.texture = load("res://recursos/personajes/"+spr+".webp")
	if animado:
		sprite_izq.position.x = x_izq - 100
		tween = get_tree().create_tween()
		tween.tween_property(sprite_izq, "position", Vector2(x_izq, sprite_izq.position.y), 0.3)
		await tween.finished

func encolar(texto_sig):
	activo = true
	mantenido = false
	cola.push_back(texto_sig)

func esconder():
	self.visible = false
	bocadillo.flip_h = true
	cambiar_a_on()
	cambiar_sprite_izquierdo("retratoPj", false)
	cambiar_sprite_derecho("nada", false)
	cerrar_opcs()

func mostrar():
	self.visible = true

func decir(cadena):
	mostrar()
	estado = Estado.LEYENDO
	var cad = tr(cadena)
	texto.text = cad
	texto.visible_ratio = 0
	tween = get_tree().create_tween()
	tween.tween_property(texto, "visible_ratio", 1, 0.02 * len(cad))
	var i = 0
	cambiar_voz()
	while texto.visible_ratio < 1:
		pitar(cad[i])
		i += 1
		await get_tree().create_timer(0.1).timeout
	next.text = "^"
	estado = Estado.TERMINADO

func cambiar_voz():
	if bocadillo_off.visible:
		reproductor.stream = load("res://recursos/audios/voz_p.ogg")
		return
	var hablante = text_der if bocadillo.flip_h else text_izq
	match hablante:
		"retratoPj":
			reproductor.stream = load("res://recursos/audios/voz_l.ogg")
	#Voces human
		"retratoJh":
			reproductor.stream = load("res://recursos/audios/voz_p.ogg")
		"retratoJhEmocionado":
			reproductor.stream = load("res://recursos/audios/voz_p.ogg")
		"retratoJhNervioso":
			reproductor.stream = load("res://recursos/audios/voz_p.ogg")
		"retratoJhSonriente":
			reproductor.stream = load("res://recursos/audios/voz_p.ogg")
		"retratoJhSospechoso":
			reproductor.stream = load("res://recursos/audios/voz_p.ogg")
		"retratoEsclavo":
			reproductor.stream = load("res://recursos/audios/voz_d.ogg")
		"retratoEsclavo2":
			reproductor.stream = load("res://recursos/audios/voz_u.ogg")
	#Voces DryLab
		"retratoJdl":
			reproductor.stream = load("res://recursos/audios/voz_b.ogg")
		"retratoJdlJuzgandote":
			reproductor.stream = load("res://recursos/audios/voz_b.ogg")
		"retratoJdlPensando":
			reproductor.stream = load("res://recursos/audios/voz_b.ogg")
		"retratoJdlSonriente":
			reproductor.stream = load("res://recursos/audios/voz_b.ogg")
		"retratoJdl":
			reproductor.stream = load("res://recursos/audios/voz_b.ogg")
		"retratoEsclavo3":
			reproductor.stream = load("res://recursos/audios/voz_w.ogg")
		"retratoEsclavo4":
			reproductor.stream = load("res://recursos/audios/voz_l.ogg")
	#Voces WetLab
		"retratoJwl":
			reproductor.stream = load("res://recursos/audios/voz_d.ogg")
		"retratoJwlSonriente":
			reproductor.stream = load("res://recursos/audios/voz_d.ogg")
		"retratoJwlConfiada":
			reproductor.stream = load("res://recursos/audios/voz_d.ogg")
		"retratoJwlContenta":
			reproductor.stream = load("res://recursos/audios/voz_d.ogg")
		"retratoJwlLlorando":
			reproductor.stream = load("res://recursos/audios/voz_d.ogg")
		"retratoJwlShock":
			reproductor.stream = load("res://recursos/audios/voz_d.ogg")
		"retratoJwlSorprendida":
			reproductor.stream = load("res://recursos/audios/voz_d.ogg")
		"retratoEsclavo5":
			reproductor.stream = load("res://recursos/audios/voz_o.ogg")
		"retratoEsclavo6":
			reproductor.stream = load("res://recursos/audios/voz_a.ogg")
	#Voces Redes
		"retratoJr":
			reproductor.stream = load("res://recursos/audios/voz_a.ogg")
		"retratoJrContenta":
			reproductor.stream = load("res://recursos/audios/voz_a.ogg")
		"retratoJrSorprendida":
			reproductor.stream = load("res://recursos/audios/voz_a.ogg")
		"retratoEsclavo7":
			reproductor.stream = load("res://recursos/audios/voz_b.ogg")
		"retratoEsclavo8":
			reproductor.stream = load("res://recursos/audios/voz_k.ogg")
	#Voces Wiki
		"retratoJw":
			reproductor.stream = load("res://recursos/audios/voz_i.ogg")
		"retratoJwCalmado":
			reproductor.stream = load("res://recursos/audios/voz_i.ogg")
		"retratoJwContento":
			reproductor.stream = load("res://recursos/audios/voz_i.ogg")
		"retratoJwNervios":
			reproductor.stream = load("res://recursos/audios/voz_i.ogg")
		"retratoJwShock":
			reproductor.stream = load("res://recursos/audios/voz_i.ogg")
		"retratoEsclavo9":
			reproductor.stream = load("res://recursos/audios/voz_g.ogg")
		"retratoEsclavo10":
			reproductor.stream = load("res://recursos/audios/voz_u.ogg")
		_:
			reproductor.stream = load("res://recursos/audios/voz_a.ogg")

func pitar(letra):
	var voz = reproductor.duplicate()
	voz.pitch_scale += randf_range(-0.1, 0.1)
	if letra in ['a', 'e', 'i', 'o', 'u']:
		voz.pitch_scale += 0.2
	get_tree().root.add_child(voz)
	voz.play()
	await voz.finished
	voz.queue_free()

func estar_activo():
	return activo
