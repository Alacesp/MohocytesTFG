extends Button
@onready var camara = $"../../../../../Camara"
@onready var formulario = get_tree().get_current_scene()

func _on_mouse_entered():
	get_parent().self_modulate= Color.GRAY

func _on_mouse_exited():
	get_parent().self_modulate = Color.WHITE

func seleccionar():
	var padre = get_parent().get_parent()
	var hijos = padre.get_children()
	for i in hijos.size():
		hijos[i].modulate = Color.WHITE
	get_parent().modulate = Color.GRAY

func _on_pressed() -> void:
	seleccionar()
	formulario.respuestas[camara.pregunta-1]=str(self.name)
	print (formulario.respuestas)
