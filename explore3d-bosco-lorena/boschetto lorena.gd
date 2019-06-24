extends StaticBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var material: SpatialMaterial = load("res://Becco_004.material")
	material.metallic_specular = 0
	ResourceSaver.save("res://Becco_004.material", material)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
