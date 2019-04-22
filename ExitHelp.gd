extends Label

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("ui_exit"):
			get_tree().quit()
