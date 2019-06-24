extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var files = []
	list_files("res://",".material",files)
	
	for f in files:
		var m:SpatialMaterial = load(f)
		print("Handling"+ f + " Metallic: "+str(m.metallic) + " Specular: "+str(m.metallic_specular) + " Roughness: "+str(m.roughness))
		m.metallic = 0
		m.metallic_specular = 0
		m.roughness = 1
		
		ResourceSaver.save(f, m)
		
	
	pass # Replace with function body.

func list_files(path: String, suffix: String, files: Array):
	
	var dir: Directory = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file: String = dir.get_next()
		if file == "":
			break
		if file.begins_with("."):
			continue
		if dir.current_is_dir():
			list_files(path+"/"+file,suffix,files)
		else:
			if file.ends_with(suffix):
				files.append(path+"/"+file)

	dir.list_dir_end()

	return files