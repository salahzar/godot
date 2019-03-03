extends MeshInstance


func _on_Area_body_entered(body):
	Globals.livello += 1
	Globals.goto_scene("livello"+str(Globals.livello),{})

