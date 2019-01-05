extends Sprite

var speed = 300

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	
	if Input.is_key_pressed(KEY_UP):
		self.position.y -= speed * delta
	if Input.is_key_pressed(KEY_DOWN):
		self.position.y += speed * delta
	if Input.is_key_pressed(KEY_LEFT):
		self.position.x -= speed * delta
	if Input.is_key_pressed(KEY_RIGHT):
		self.position.x += speed * delta
