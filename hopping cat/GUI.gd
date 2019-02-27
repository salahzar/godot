extends Panel

var score = 0

func _ready():

	add_to_group("GUI")

func display(string):
	$Label.text = str(string)
	
func score():
	score += 1
	$Label2.text = str(score)
	if score >= 4:
		$Label3.text = "HAI VINTO"
		$Timer.start()
		




func _on_Timer_timeout():
	get_tree().quit()
