extends StaticBody

func left_button(event):
	return (event is InputEventMouseButton 
		and event.button_index == 1 
		and event.is_pressed() 
		and not event.is_echo())

func _input_event(viewport, event, shape_idx, vector, integer):
	if left_button(event):	    
		Global.GUI.display("Casetta")