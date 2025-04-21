extends Sprite2D



func _on_ice_pressed() -> void:
	if (GlobalWetGame.ice != null):
		print("a")
	else:
		print("b")
