extends Node

var points = 0
var remaining_time = 90
var secuencia = 0
var secuencia_obs = 0

func increase_points(n):
	points += n

func decrease_points(n):
	points -= n
	if(points < 0):
		points = 0

func reset():
	points = 0
