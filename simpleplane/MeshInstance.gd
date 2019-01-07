extends MeshInstance

var angle = 0
export (String) var image = "res://image.jpg"
export (int) var p = 0

func _ready():
	
	var mat = SpatialMaterial.new();
	#mat.flags_unshaded = true;
	mat.albedo_texture = load(image);
	
	var size = 2;
	var surfaceTool = SurfaceTool.new();
	
	surfaceTool.begin(Mesh.PRIMITIVE_TRIANGLES)
	surfaceTool.set_material(mat)
	surfaceTool.add_uv(Vector2(1, 1));
	surfaceTool.add_vertex(Vector3(-size, -size,  0))
	surfaceTool.add_uv(Vector2(0, 0));
	surfaceTool.add_vertex(Vector3( size,  size,  0))
	surfaceTool.add_uv(Vector2(0, 1));
	surfaceTool.add_vertex(Vector3( size, -size,  0))
	surfaceTool.add_uv(Vector2(1, 1));
	surfaceTool.add_vertex(Vector3(-size, -size,  0))
	surfaceTool.add_uv(Vector2(1, 0));
	surfaceTool.add_vertex(Vector3(-size,  size,  0))
	surfaceTool.add_uv(Vector2(0, 0));
	surfaceTool.add_vertex(Vector3( size,  size,  0))
	surfaceTool.generate_normals()
	
	var new_mesh = surfaceTool.commit()
	self.mesh = new_mesh;
	
	
func _process(delta):
    #angle += delta * 30
    self.rotation_degrees = Vector3(0, 0, angle)
