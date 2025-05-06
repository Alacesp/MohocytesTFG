extends Node2D

var rng = RandomNumberGenerator.new()

var estado1 = "Serious"
var estado2 = "Happy"
var estado3 = "Happy"
var estado4 = "Happy"



func _process(delta: float) -> void:
	if( $Cliente1.satisfied == true ):
		$Cliente1.satisfied = false
		$Cliente1.reroll = true
		match estado1:
			"Happy":
				GlobalWetGame.puntuacion -= 300
				print("Angry: -300")
			"Serious":
				GlobalWetGame.puntuacion += 50
				print("Happy: +50")
				
			"Sad":
				GlobalWetGame.puntuacion += 0
				print("Serious: +0")
				
			"Angry":
				GlobalWetGame.puntuacion -= 100
				print("Sad: -100")
				
		estado1 = "Happy"
		$"Cliente1/Timer".start(5)
	if( $Cliente2.satisfied == true ):
		$Cliente2.satisfied = false
		$Cliente2.reroll = true
		
		match estado2:
			"Happy":
				GlobalWetGame.puntuacion -= 300
				print("Angry: -300")
			"Serious":
				GlobalWetGame.puntuacion += 50
				print("Happy: +50")
				
			"Sad":
				GlobalWetGame.puntuacion += 0
				print("Serious: +0")
				
			"Angry":
				GlobalWetGame.puntuacion -= 100
				print("Sad: -100")
		
		estado2 = "Happy"
		$"Cliente2/Timer2".start(5)
	if( $Cliente3.satisfied == true ):
		$Cliente3.satisfied = false
		$Cliente3.reroll = true
		
		match estado3:
			"Happy":
				GlobalWetGame.puntuacion -= 300
				print("Angry: -300")
			"Serious":
				GlobalWetGame.puntuacion += 50
				print("Happy: +50")
				
			"Sad":
				GlobalWetGame.puntuacion += 0
				print("Serious: +0")
				
			"Angry":
				GlobalWetGame.puntuacion -= 100
				print("Sad: -100")
		
		estado3 = "Happy"
		$"Cliente3/Timer3".start(5)
	if( $Cliente4.satisfied == true ):
		$Cliente4.satisfied = false
		$Cliente4.reroll = true
		
		match estado4:
			"Happy":
				GlobalWetGame.puntuacion -= 300
				print("Angry: -300")
			"Serious":
				GlobalWetGame.puntuacion += 50
				print("Happy: +50")
				
			"Sad":
				GlobalWetGame.puntuacion += 0
				print("Serious: +0")
				
			"Angry":
				GlobalWetGame.puntuacion -= 100
				print("Sad: -100")
		
		estado4 = "Happy"
		$"Cliente4/Timer4".start(5)

func _on_timer_timeout() -> void:
	match estado1:
		"Happy":
			$"Cliente1".visible=true
			$"../camara/Clientes/Cliente1".visible = true
			$"../camara/Clientes/Cliente1".texture = preload("res://recursos/happySymbol.png")
			estado1 = "Serious"
			$"Cliente1".texture = preload("res://recursos/amazingMan.png")
			$"Cliente1/Timer".start(20)
		"Serious":
			estado1 = "Sad"
			$"Cliente1/Timer".start(10)
			$"Cliente1".texture = preload("res://recursos/boredMan.png")
			$"../camara/Clientes/Cliente1".texture = preload("res://recursos/seriousSymbol.png")
		"Sad":
			estado1 = "Angry"
			$"Cliente1/Timer".start(20)
			$"Cliente1".texture = preload("res://recursos/sadMan.png")
			$"../camara/Clientes/Cliente1".texture = preload("res://recursos/sadSymbol.png")
		"Angry":
			estado1 = "Happy"
			$"Cliente1".texture = preload("res://recursos/angryMan.png")
			$"../camara/Clientes/Cliente1".texture = preload("res://recursos/angrySymbol.png")

func _on_timer_2_timeout() -> void:
	match estado2:
		"Happy":
			$"Cliente2".visible=true
			$"../camara/Clientes/Cliente2".visible = true
			$"../camara/Clientes/Cliente2".texture = preload("res://recursos/happySymbol.png")
			estado2 = "Serious"
			$"Cliente2".texture = preload("res://recursos/amazingMan.png")
			$"Cliente2/Timer2".start(20)
		"Serious":
			estado2 = "Sad"
			$"Cliente2/Timer2".start(10)
			$"Cliente2".texture = preload("res://recursos/boredMan.png")
			$"../camara/Clientes/Cliente2".texture = preload("res://recursos/seriousSymbol.png")
		"Sad":
			estado2 = "Angry"
			$"Cliente2/Timer2".start(20)
			$"Cliente2".texture = preload("res://recursos/sadMan.png")
			$"../camara/Clientes/Cliente2".texture = preload("res://recursos/sadSymbol.png")
		"Angry":
			estado2 = "Happy"
			$"Cliente2".texture = preload("res://recursos/angryMan.png")
			$"../camara/Clientes/Cliente2".texture = preload("res://recursos/angrySymbol.png")

func _on_timer_3_timeout() -> void:
	match estado3:
		"Happy":
			$"Cliente3".visible=true
			$"../camara/Clientes/Cliente3".visible = true
			$"../camara/Clientes/Cliente3".texture = preload("res://recursos/happySymbol.png")
			estado3 = "Serious"
			$"Cliente3".texture = preload("res://recursos/amazingMan.png")
			$"Cliente3/Timer3".start(20)
		"Serious":
			estado3 = "Sad"
			$"Cliente3/Timer3".start(10)
			$"Cliente3".texture = preload("res://recursos/boredMan.png")
			$"../camara/Clientes/Cliente3".texture = preload("res://recursos/seriousSymbol.png")
		"Sad":
			estado3 = "Angry"
			$"Cliente3/Timer3".start(20)
			$"Cliente3".texture = preload("res://recursos/sadMan.png")
			$"../camara/Clientes/Cliente3".texture = preload("res://recursos/sadSymbol.png")
		"Angry":
			estado3 = "Happy"
			$"Cliente3".texture = preload("res://recursos/angryMan.png")
			$"../camara/Clientes/Cliente3".texture = preload("res://recursos/angrySymbol.png")

func _on_timer_4_timeout() -> void:
	match estado4:
		"Happy":
			$"Cliente4".visible=true
			$"../camara/Clientes/Cliente4".visible = true
			$"../camara/Clientes/Cliente4".texture = preload("res://recursos/happySymbol.png")
			estado4 = "Serious"
			$"Cliente4".texture = preload("res://recursos/amazingMan.png")
			$"Cliente4/Timer4".start(20)
		"Serious":
			estado4 = "Sad"
			$"Cliente4/Timer4".start(10)
			$"Cliente4".texture = preload("res://recursos/boredMan.png")
			$"../camara/Clientes/Cliente4".texture = preload("res://recursos/seriousSymbol.png")
		"Sad":
			estado4 = "Angry"
			$"Cliente4/Timer4".start(20)
			$"Cliente4".texture = preload("res://recursos/sadMan.png")
			$"../camara/Clientes/Cliente4".texture = preload("res://recursos/sadSymbol.png")
		"Angry":
			estado4 = "Happy"
			$"Cliente4".texture = preload("res://recursos/angryMan.png")
			$"../camara/Clientes/Cliente4".texture = preload("res://recursos/angrySymbol.png")
