extends Camera

onready var Yaw = get_parent()

## Increase this value to give a slower turn speed
const CAMERA_TURN_SPEED = 200

onready var lastPosition = get_viewport().get_mouse_position()

func get_mouse_position():
	return get_viewport().get_mouse_position()

func _ready():
	## Tell Godot that we want to handle input
	set_process(true)

func look_updown_rotation(rotation = 0):
	"""
  Returns a new Vector3 which contains only the x direction
  We'll use this vector to compute the final 3D rotation later
	"""
	var toReturn = self.get_rotation() + Vector3(rotation, 0, 0)

	##
	## We don't want the player to be able to bend over backwards
	## neither to be able to look under their arse.
	## Here we'll clamp the vertical look to 90° up and down
	toReturn.x = clamp(toReturn.x, PI / -2, PI / 2)

	return toReturn

func look_leftright_rotation(rotation = 0):
	"""
  Returns a new Vector3 which contains only the y direction
  We'll use this vector to compute the final 3D rotation later
	"""
	return Yaw.get_rotation() + Vector3(0, rotation, 0)

func updateMousePosition(mouseMotion):
	"""
	First person camera controls
	"""
	##
	## We'll use the parent node "Yaw" to set our left-right rotation
	## This prevents us from adding the x-rotation to the y-rotation
	## which would result in a kind of flight-simulator camera
	Yaw.set_rotation(look_leftright_rotation(mouseMotion.x / -CAMERA_TURN_SPEED))

	##
	## Now we can simply set our y-rotation for the camera, and let godot
	## handle the transformation of both together
	self.set_rotation(look_updown_rotation(mouseMotion.y / -CAMERA_TURN_SPEED))

func _process(delta):
	##
	## We're using _process because in a FPS game
	## Often the user has a very powerful computer
	## It will be cheaper in the long run to simply process every frame
	## than to try and handle all MouseMotion events
	var newPosition = get_mouse_position()
	
	## Update the users viewport
	updateMousePosition(newPosition - lastPosition)
	
	## Saving the current mouse position
	## Now we can calculate the difference on the next frame
	## and so understand how much we should move the pointer
	self.lastPosition = newPosition

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
