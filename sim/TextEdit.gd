extends TextEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	editable = false

func _on_button_pressed():
	Globals.timeModifier = float(text)


func _on_mouse_entered():
	editable = true


func _on_mouse_exited():
	editable = false
