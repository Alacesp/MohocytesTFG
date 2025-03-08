extends RigidBody2D

var type
var eaten = false
var wasted = false
static var falling_speed = 350
var increment_speed = 50
const shapes = ["Circulo", "Estrella", "Rombo", "Triangulo"]

func _ready():
	type = shapes[randi_range(0,3)]
	var sprite = Sprite2D.new()
	sprite.texture = load("res://juego_dry/ObjectosQueCaen/" + type + ".webp")
	sprite.apply_scale(Vector2(0.3, 0.3))
	sprite.apply_scale(Vector2(0.1,0.1))
	# Asignamos una ubicación aleatoria
	position.x = randi_range(100, 1050)
	var collision_shape = CollisionShape2D.new()
	var shape = RectangleShape2D.new()
	shape.size = Vector2(30,70)
	collision_shape.shape = shape
	add_child(sprite)
	add_child(collision_shape)
	# Deteccion de colisiones
	set_contact_monitor(true)
	set_max_contacts_reported(1)
	connect("body_entered", _on_body_entered)
	# Gravedad y velocidad
	gravity_scale = 0
	linear_velocity.y = falling_speed

func _process(_delta):
	if position.y > 700 :
		wasted = true

func _on_body_entered(_body):
	if type == shapes[Score.secuencia]:
		Score.secuencia += 1
		Score.secuencia_obs += 1
		if Score.secuencia == 4:
			Score.secuencia = 0
			increase_speed()
			Score.increase_points(3)
			var marcador_completo_timer = Timer.new()
			marcador_completo_timer.wait_time = 0.4
			marcador_completo_timer.one_shot = true
			marcador_completo_timer.autostart = true
			get_tree().root.add_child(marcador_completo_timer)
			marcador_completo_timer.connect("timeout", resetear)
			marcador_completo_timer.start()
			Score.secuencia_obs = 0
	else:
		resetear()
		Score.decrease_points(1)
	eaten = true

func resetear():
	Score.secuencia_obs = 0
	Score.secuencia = 0

func increase_speed():
	falling_speed += increment_speed
