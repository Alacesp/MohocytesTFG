extends Sprite2D
var pedido

func _ready():
	match GlobalWetGame.dificulty:
		"Tutorial":
			pedido = ["Yellow", "Red"]



func _on_mouse_entered() -> void:
	pass # Replace with function body.
