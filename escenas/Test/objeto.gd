extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos: Vector2

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			GlobalDragAndDrop.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			GlobalDragAndDrop.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
				match self.name:
					"Objeto":
						GlobalDragAndDrop.respuestasPreguntaFormato6[0] = body_ref.name
						print(GlobalDragAndDrop.respuestasPreguntaFormato6)
					"Objeto2":
						GlobalDragAndDrop.respuestasPreguntaFormato6[1] = body_ref.name
						print(GlobalDragAndDrop.respuestasPreguntaFormato6)
					"Objeto3":
						GlobalDragAndDrop.respuestasPreguntaFormato6[2] = body_ref.name
						print(GlobalDragAndDrop.respuestasPreguntaFormato6)
					"Objeto4":
						GlobalDragAndDrop.respuestasPreguntaFormato6[3] = body_ref.name
						print(GlobalDragAndDrop.respuestasPreguntaFormato6)
					"Objeto5":
						GlobalDragAndDrop.respuestasPreguntaFormato6[4] = body_ref.name
						print(GlobalDragAndDrop.respuestasPreguntaFormato6)
					"Objeto6":
						GlobalDragAndDrop.respuestasPreguntaFormato7[0] = body_ref.name
						print(GlobalDragAndDrop.respuestasPreguntaFormato7)
					"Objeto7":
						GlobalDragAndDrop.respuestasPreguntaFormato7[1] = body_ref.name
						print(GlobalDragAndDrop.respuestasPreguntaFormato7)
					"Objeto8":
						GlobalDragAndDrop.respuestasPreguntaFormato7[2] = body_ref.name
						print(GlobalDragAndDrop.respuestasPreguntaFormato7)
				
			else:
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_mouse_entered() -> void:
	if not GlobalDragAndDrop.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited() -> void:
	if not GlobalDragAndDrop.is_dragging:
		draggable = false
		scale = Vector2(1, 1)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group('dropable') && body_ref == body:
		is_inside_dropable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.75)
