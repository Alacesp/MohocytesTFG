extends Button
@onready var arb = get_tree()

func _on_pressed() -> void:
		arb.change_scene_to_file("res://escenas/SalaWiki/SalaWiki.tscn")
