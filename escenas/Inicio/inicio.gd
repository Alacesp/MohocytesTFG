extends Control

func _ready():
	var derecha = [$Jugable, $Human, $Wiki]
	var izquierda = [$DryLab, $WetLab, $Redes]
	var pos = 0
	while true:
		if pos == 3:
			derecha.shuffle()
			izquierda.shuffle()
			pos = 0
		if randf_range(1,100) <= 10:
			aparecer_personaje($PayasoD, true)
			await aparecer_personaje($PayasoI, false)
		else:
			aparecer_personaje(derecha[pos], true)
			await aparecer_personaje(izquierda[pos], false)
		pos += 1

func aparecer_personaje(personaje, der):
	if der:
		await tweenear(personaje, 950, 380)
		await tweenear(personaje, randi_range(920, 980), randi_range(350, 410))
		await tweenear(personaje, randi_range(920, 980), randi_range(350, 410))
		await tweenear(personaje, randi_range(920, 980), randi_range(350, 410))
		await tweenear(personaje, 1300, 380)
	else:
		await tweenear(personaje, 200, 380)
		await tweenear(personaje, randi_range(180, 220), randi_range(350, 410))
		await tweenear(personaje, randi_range(180, 220), randi_range(350, 410))
		await tweenear(personaje, randi_range(180, 220), randi_range(350, 410))
		await tweenear(personaje, -150, 380)

func tweenear(personaje, x, y):
	var tween = get_tree().create_tween()
	tween.tween_property(personaje, "position", Vector2(x, y), 2)
	await tween.finished
	tween.kill()
