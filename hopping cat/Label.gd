extends Label
func _ready():
	add_to_group("GUI")

func display(string):
	text = str(string)