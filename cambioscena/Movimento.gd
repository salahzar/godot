extends KinematicBody

const MOVE_SPEED = 1.2
const JUMP_FORCE = 3.0
const GRAVITY = 0.98
const MAX_FALL_SPEED = 30

const H_LOOK_SENS = 1.0
const V_LOOK_SENS = 0.5

onready var cam = $CamBase
onready var anim = $Graphics/AnimationPlayer

var y_velo = 0

func display(s):
	get_tree().call_group("GUI", "display", s)

func _ready():
	anim.get_animation("walk").set_loop(true)
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):

	if event is InputEventMouseMotion:
		display(" Mouse: H "+str(event.relative.x)+" V "+str(event.relative.y))
		var h= event.relative.x
		var v= event.relative.y
		ruota_camera(h,-v)

	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP:
			$CamBase/Camera.translation.z += .2
			display("rotellina ^")

		if event.button_index == BUTTON_WHEEL_DOWN:
			$CamBase/Camera.translation.z -= .2
			display("rotellina v")

func ruota_camera(h,v):
		cam.rotation_degrees.x -= v * V_LOOK_SENS
		cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -45, +45)
		rotation_degrees.y -= h * H_LOOK_SENS

func _physics_process(delta):
	var move_vec = Vector3()
	if Input.is_action_pressed("ui_down"):
		display("v")
		move_vec.z -= 1

	if Input.is_action_pressed("ui_up"):
		display("^")
		move_vec.z += 1
	if Input.is_action_pressed("ui_right"):
		display("->")
		ruota_camera(1,0)
		#move_vec.x += 1
	if Input.is_action_pressed("ui_left"):
		display("<-")
		ruota_camera(-1,0)
		#move_vec.x -= 1
	if Input.is_action_pressed("ui_page_up"):
		display("/")
		ruota_camera(0,1)
		#move_vec.x += 1
	if Input.is_action_pressed("ui_page_down"):
		display("\\//")
		ruota_camera(0,-1)

	move_vec = move_vec.normalized()
	move_vec = move_vec.rotated(Vector3(0, 1, 0), rotation.y)
	move_vec *= MOVE_SPEED
	move_vec.y = y_velo
	move_and_slide(move_vec, Vector3(0, 1, 0))
	handle()
	var grounded = is_on_floor()
	y_velo -= GRAVITY
	var just_jumped = false
	if grounded and Input.is_action_just_pressed("ui_select"):
		display("^^^^")
		just_jumped = true
		y_velo = JUMP_FORCE
	if grounded and y_velo <= 0:
		y_velo = -0.1
	if y_velo < -MAX_FALL_SPEED:
		y_velo = -MAX_FALL_SPEED

	if just_jumped:
		play_anim("jump")
	elif grounded:
		if move_vec.x == 0 and move_vec.z == 0:
			play_anim("idle")
		else:
			play_anim("walk")

func play_anim(name):
	if anim.current_animation == name:
		return
	anim.play(name)

func handle():
	print("handle super")
	pass