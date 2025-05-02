extends Node2D

var rng = RandomNumberGenerator.new()

var estado1 = "Serious"
var estado2 = "Happy"
var estado3 = "Happy"
var estado4 = "Happy"

func _on_timer_timeout() -> void:
	match estado1:
		"Happy":
			$"Cliente1".visible=true
			estado1 = "Serious"
			$"Cliente1".texture = preload("res://recursos/amazingMan.png")
			$"Cliente1/Timer".start(20)
		"Serious":
			print("aaaaaaaaaanmjnsajnfcsa")
			estado1 = "Sad"
			$"Cliente1/Timer".start(5)
			$"Cliente1".texture = preload("res://recursos/boredMan.png")
		"Sad":
			print("aaangry")
			estado1 = "Angry"
			$"Cliente1/Timer".start(5)
			$"Cliente1".texture = preload("res://recursos/sadMan.png")
		"Angry":
			print("aaangry")
			estado1 = "Happy"
			$"Cliente1".texture = preload("res://recursos/angryMan.png")

func _on_timer_2_timeout() -> void:
	match estado2:
		"Happy":
			$"Cliente2".visible=true
			estado2 = "Serious"
			$"Cliente2".texture = preload("res://recursos/amazingMan.png")
			$"Cliente2/Timer2".start(5)
		"Serious":
			print("aaaaaaaaaanmjnsajnfcsa")
			estado2 = "Sad"
			$"Cliente2/Timer2".start(5)
			$"Cliente2".texture = preload("res://recursos/boredMan.png")
		"Sad":
			print("aaangry")
			estado2 = "Angry"
			$"Cliente2/Timer2".start(5)
			$"Cliente2".texture = preload("res://recursos/sadMan.png")
		"Angry":
			print("aaangry")
			estado2 = "Happy"
			$"Cliente2".texture = preload("res://recursos/angryMan.png")


func _on_timer_3_timeout() -> void:
	match estado3:
		"Happy":
			$"Cliente3".visible=true
			estado3 = "Serious"
			$"Cliente3".texture = preload("res://recursos/amazingMan.png")
			$"Cliente3/Timer3".start(5)
		"Serious":
			print("aaaaaaaaaanmjnsajnfcsa")
			estado3 = "Sad"
			$"Cliente3/Timer3".start(5)
			$"Cliente3".texture = preload("res://recursos/boredMan.png")
		"Sad":
			print("aaangry")
			estado3 = "Angry"
			$"Cliente3/Timer3".start(5)
			$"Cliente3".texture = preload("res://recursos/sadMan.png")
		"Angry":
			print("aaangry")
			estado3 = "Happy"
			$"Cliente3".texture = preload("res://recursos/angryMan.png")


func _on_timer_4_timeout() -> void:
	match estado4:
		"Happy":
			$"Cliente4".visible=true
			estado4 = "Serious"
			$"Cliente4".texture = preload("res://recursos/amazingMan.png")
			$"Cliente4/Timer4".start(5)
		"Serious":
			print("aaaaaaaaaanmjnsajnfcsa")
			estado4 = "Sad"
			$"Cliente4/Timer4".start(5)
			$"Cliente4".texture = preload("res://recursos/boredMan.png")
		"Sad":
			print("aaangry")
			estado4 = "Angry"
			$"Cliente4/Timer4".start(5)
			$"Cliente4".texture = preload("res://recursos/sadMan.png")
		"Angry":
			print("aaangry")
			estado4 = "Happy"
			$"Cliente4".texture = preload("res://recursos/angryMan.png")
