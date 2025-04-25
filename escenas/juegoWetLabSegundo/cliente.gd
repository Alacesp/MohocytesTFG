extends Sprite2D
var pedido

func _ready():
	match GlobalWetGame.dificulty:
		"Tutorial":
			pedido = ["Yellow", "Red"]
