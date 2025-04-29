extends Node2D

var rng = RandomNumberGenerator.new()


func _on_timer_timeout() -> void:
	$"Cliente1".visible=true


func _on_timer_2_timeout() -> void:
	$"Cliente2".visible=true


func _on_timer_3_timeout() -> void:
	$"Cliente3".visible=true


func _on_timer_4_timeout() -> void:
	$"Cliente4".visible=true
