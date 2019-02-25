extends "res://Movimento.gd"

func handle():
	for i in range(get_slide_count()):
		var collision = get_slide_collision(i)
		var name = str(collision.collider.get_path())
		if "target" in name:
			print("collide with "+name)
			Globals.livello += 1
			Globals.goto_scene("livello"+str(Globals.livello),{})
