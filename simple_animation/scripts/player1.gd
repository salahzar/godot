extends KinematicBody2D

var SPEED = 8000
var UP = Vector2(0,-1)
var move = Vector2()
var action = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	move = Vector2(0,0)
	action = false
	
	muoviti(delta)
	salta()
	gravita()
	verificaFermo()
	move_and_slide(move)
	
func muoviti(delta):
	if(Input.is_action_pressed("ui_right")):
		$AnimatedSprite.play("running right")
		$AnimatedSprite.flip_h = false
		move.x += SPEED * delta
		action = true
		
	if(Input.is_action_pressed("ui_left") && !action):
		$AnimatedSprite.play("running right")
		$AnimatedSprite.flip_h = true
		move.x -= SPEED * delta
		action = true
		
		
func gravita():
	if(!is_on_floor()):
		move.y += 200
	
func verificaFermo():
	
	if(!action):
		$AnimatedSprite.play("default")
		
func salta():
	if(Input.is_action_pressed("ui_up")):
		$AnimatedSprite.play("salta")
		move.y -= 700
		action = true
		