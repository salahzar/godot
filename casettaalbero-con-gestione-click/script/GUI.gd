extends Panel

func _ready():
	Global.GUI = self

func display(s):
	$Label.text=s