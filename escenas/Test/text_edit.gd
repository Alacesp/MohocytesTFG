extends TextEdit

#func _init():
#	self.background_color = Color(0.862745, 0.0784314, 0.235294, 1)

#func _on_text_changed() -> void:
	#self.text 

func _on_focus_entered() -> void:
	get_parent().modulate = Color.GRAY

func _on_focus_exited() -> void:
	get_parent().modulate = Color.WHITE
