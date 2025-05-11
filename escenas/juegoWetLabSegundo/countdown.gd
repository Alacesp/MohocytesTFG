extends Label
@onready var timer = $"../../Timer"
@onready var arb = get_tree()

func _ready() -> void:
	timer.start()
	
func time_left():
	var time_left = timer.time_left
	var minute = floor(time_left/60)
	var second = int(time_left)%60
	return [minute, second]

func _process(delta: float) -> void: 
	self.text = "%02d:%02d" % time_left()
	if (timer.time_left <= 60):
		GlobalWetGame.dificulty=3
	elif(timer.time_left <= 120):
		GlobalWetGame.dificulty = 2


func _on_timer_timeout() -> void:
	arb.change_scene_to_file("res://escenas/juegoWetLabSegundo/WetEndScene.tscn")
