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
	
	var uv00 = Vector2(0,0)
	var uv10 = Vector2(1,0)
	var uv01 = Vector2(0,1)
	var uv11 = Vector2(1,1)
	
	# piano di sotto 
	var p0 = Vector3( -0.5, -0.5, 0.5)
	var p1 = Vector3( 0.5, -0.5, 0.5)
	var p2 = Vector3( 0.5, -0.5, -0.5)
	var p3 = Vector3( -0.5, -0.5, -0.5)
	
	# piano di sopra
	var p4 = Vector3( -0.5, 0.5, 0.5)
	var p5 = Vector3( 0.5,0.5,0.5)
	var p6 = Vector3( 0.5,0.5,-0.5)
	var p7 = Vector3( -0.5, 0.5, -0.5)
	
	surfaceTool.begin(Mesh.PRIMITIVE_TRIANGLES)
	surfaceTool.set_material(mat)
	var uvs = [ uv11, uv00, uv01, uv11, uv10, uv00 ]
	# +z
	plane(surfaceTool, uvs, [ p0, p5, p1, p0, p4, p5])
	# +y
	plane(surfaceTool, uvs,	[ p4, p6, p5, p4, p7, p6])
	# -x
	plane(surfaceTool, uvs, [ p0, p7, p4, p0, p3, p7])
	# -y
	plane(surfaceTool, uvs, [ p3, p2, p6, p3, p6, p7])
	# +x
	plane(surfaceTool, uvs, [ p6, p1, p5, p6, p2, p1])
	# -y
	plane(surfaceTool, uvs, [ p1, p2, p3, p1, p3, p0])
	surfaceTool.generate_normals()
	
	var new_mesh = surfaceTool.commit()
	self.mesh = new_mesh;
	
func plane(surfaceTool,uvs, points):
	for i in range(uvs.size()):
		surfaceTool.add_uv(uvs[i])
		surfaceTool.add_vertex(points[i])

	
	
func _process(delta):
    angle += delta * 100
    self.rotation_degrees = Vector3(angle, angle, angle)
