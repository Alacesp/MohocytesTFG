extends Node2D

var falling_objects = []

func _ready():
	create_falling_object()

func _process(_delta):
	for falling_object in falling_objects:
		if falling_object.eaten:
			remove_child(falling_object)
			falling_objects.erase(falling_object)
		elif falling_object.wasted:
			remove_child(falling_object)
			falling_objects.erase(falling_object)

func create_falling_object():
	var falling_object = load("res://juego_dry/FallingObject.gd").new()
	falling_objects.append(falling_object)
	add_child(falling_object)

func _on_timer_timeout():
	create_falling_object()

func _on_stopwatch_timeout():
	Score.remaining_time -= 1
	if Score.remaining_time == 0:
		get_tree().change_scene_to_file("res://juego_dry/EndScene.tscn")
