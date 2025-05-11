extends TextEdit
@onready var camara = $"../../../../../Camara"
@onready var formulario = get_tree().get_current_scene()

func _on_mouse_entered():
	get_parent().modulate.a = 0.85

func _on_mouse_exited():
	get_parent().modulate.a = 1

func seleccionar():
	var padre = get_parent().get_parent()
	var hijos = padre.get_children()
	for i in hijos.size():
		hijos[i].modulate = Color.WHITE
	get_parent().modulate = Color.GRAY


func _on_focus_entered() -> void:
	seleccionar()


func _on_focus_exited() -> void:
	formulario.respuestas[camara.pregunta-1]=self.text
	print (formulario.respuestas)
