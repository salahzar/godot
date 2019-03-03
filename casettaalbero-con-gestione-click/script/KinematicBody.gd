extends KinematicBody

const RAY_LENGTH = 1000
var saveColor = Color()


func _physics_process(delta):
	
	var move = Vector3()
	
	# movimento sinistra destra
	if Input.is_action_pressed("ui_left"):
		move.x = -1
		
	if Input.is_action_pressed("ui_right"):
		move.x = 1

	# movimento aventi indietro asse z
	if Input.is_action_pressed("ui_down"):
		move.z = 1
		
	if Input.is_action_pressed("ui_up"):
		move.z = -1

	# movimento alto/basso
	if Input.is_action_pressed("ui_page_up"):
		move.y = 1
		
	if Input.is_action_pressed("ui_page_down"):
		move.y = -1
		

	move_and_slide(move)
	


func left_button(event):
	return (event is InputEventMouseButton 
		and event.button_index == 1 
		and event.is_pressed() 
		and not event.is_echo())

func _input_event(viewport, event, shape_idx, vector, integer):
	if left_button(event):
	    #assuming you want the object to move upwards:
	    #self.set_linear_velocity(Vector2(0, -300))
		print("HELLO PLAYER")
		Global.GUI.display("Cliccato Player")
	