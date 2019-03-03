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
		
	if Input.is_action_just_pressed("ui_button_left"):
		var object = get_object_under_mouse()
		if object:
			var collider = object.collider
			if collider.has_method("clicked"):
				collider.clicked()
		#print(obj)
	if Input.is_action_just_released("ui_button_left"):
		var object = get_object_under_mouse()
		if object:
			var collider = object.collider
			if collider.has_method("unclicked"):
				collider.unclicked()
			
		
	move_and_slide(move)
	
# cast a ray from camera at mouse position, and get the object colliding with the ray
func get_object_under_mouse():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_from = $Camera.project_ray_origin(mouse_pos)
	var ray_to = ray_from + $Camera.project_ray_normal(mouse_pos) * RAY_LENGTH
	var space_state = get_world().direct_space_state
	var selection = space_state.intersect_ray(ray_from, ray_to)
	return selection
	
func clicked():
	print ("Clicked")
	var mesh = $MeshInstance
	saveColor = mesh.material_override.albedo_color
	mesh.material_override.albedo_color = Color(1,0,0)
func unclicked():
	print ("UnClicked")
	var mesh = $MeshInstance
	mesh.material_override.albedo_color = saveColor
	