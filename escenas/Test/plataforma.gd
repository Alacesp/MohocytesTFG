extends StaticBody2D

var occupied_by: Node2D = null  # Keep track of which object is on this platform

func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)

func _process(delta):
	if GlobalDragAndDrop.is_dragging:
		visible = true
	else:
		visible = false

# Function to add an object to the platform
func _add_object(obj: Node2D) -> void:
	occupied_by = obj
	obj.position = position  # Ensure the object is placed correctly on the platform

# Function to remove an object from the platform
func _remove_object(obj: Node2D) -> void:
	if occupied_by == obj:
		occupied_by = null
