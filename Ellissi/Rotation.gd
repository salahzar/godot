extends MeshInstance

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var fi:float = 0
export var speed: float = 0.1
export(NodePath) var node = null

var fiOrbit:float = 0
export var radiusOrbit: float = 500
export var speedOrbit: float = 0.1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	# rotate the planet around itself
	fi+=speed
	rotation_degrees = Vector3(0, fi, 0)
	
	if node:
		fiOrbit += speedOrbit
		var n = get_node(node)
		var transform: Transform = n.get_global_transform()
		var origin = transform.origin
		var myTransform: Transform = get_global_transform()
		
		global_transform.origin = origin + Vector3(radiusOrbit*cos(fiOrbit),0,radiusOrbit*sin(fiOrbit))
		#print(global_transform.origin)
	pass
