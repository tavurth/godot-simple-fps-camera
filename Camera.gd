extends Camera

onready var Yaw = get_node('/root/Spatial/Yaw')

func _ready():
	## Tell Godot that we want to handle input
	set_process_input(true)

func look_updown_rotation(rotation = 0):
	"""
	Get the new rotation for looking up and down
	"""
	var toReturn = self.get_rotation() + Vector3(rotation, 0, 0)
	toReturn.x = clamp(toReturn.x, PI / -2, PI / 2)
	return toReturn

func look_leftright_rotation(rotation = 0):
	"""
	Get the new rotation for looking left and right
	"""
	return Yaw.get_rotation() + Vector3(0, rotation, 0)

func mouse(event):
	"""
	First person camera controls
	"""
	Yaw.set_rotation(look_leftright_rotation(event.relative.x / -200))
	self.set_rotation(look_updown_rotation(event.relative.y / -200))

func _input(event):
	##
	## We'll only process mouse motion events
	if event is InputEventMouseMotion:
		return mouse(event)

func _enter_tree():
	"""
	Hide the mouse when we start
	"""
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _leave_tree():
	"""
	Show the mouse when we leave
	"""
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
