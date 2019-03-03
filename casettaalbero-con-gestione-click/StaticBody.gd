extends StaticBody

func _input_event(viewport, event, shape_idx, vector, integer):
	if (event is InputEventMouseButton 
		and event.button_index == 1 
		and event.is_pressed() 
		and not event.is_echo()):
	    #assuming you want the object to move upwards:
	    #self.set_linear_velocity(Vector2(0, -300))
		print("HELLO TREE")
		Global.GUI.display("Hello tree")