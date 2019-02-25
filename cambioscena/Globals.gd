extends Control

var livello=1

var _params

func goto_scene(name, params):
	_params = params
	get_tree().change_scene("res://"+name+".tscn")
	
func get_param(name):
	if _params != null and _params.has(name):
		return _params[name]
	return null