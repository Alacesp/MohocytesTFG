extends Button
@onready
var inventario = get_parent()
var closed = true

func _on_button_pressed() -> void:
	var tween = get_tree().create_tween()
	if closed:
		tween.tween_property(inventario, "position", Vector2(233,124), 0.5 ).set_trans(Tween.TRANS_LINEAR)
		closed = false
	else:
		tween.tween_property(inventario, "position", Vector2(233,544), 0.5 ).set_trans(Tween.TRANS_LINEAR)
		closed = true
