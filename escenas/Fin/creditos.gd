extends Node

func _ready():
	await get_tree().create_timer(1).timeout
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", Vector2(0, -2590), 40)
	while true:
		$Payaso.flip_h = !$Payaso.flip_h
		await get_tree().create_timer(0.4).timeout
