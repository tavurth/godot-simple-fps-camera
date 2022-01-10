extends Spatial

const PLAYER_MOVE_SPEED = 20

func move_forward_back(delta: float):
	"""
	Move the camera forward or backwards
	"""
	self.transform = self.transform.translated(Vector3(0, 0, delta * PLAYER_MOVE_SPEED))

func move_left_right(delta: float):
	"""
	Move the camera to the left or right
	"""
	self.transform = self.transform.translated(Vector3(delta * PLAYER_MOVE_SPEED, 0, 0))

func _process(delta: float):
	"""
	Allow the player to move the camera with WASD
	See Project settings -> Input map for keyboard bindings
	"""
	if Input.is_action_pressed("ui_up"):
		self.move_forward_back(-delta)

	elif Input.is_action_pressed("ui_down"):
		self.move_forward_back(+delta)

	if Input.is_action_pressed("ui_left"):
		self.move_left_right(-delta)

	elif Input.is_action_pressed("ui_right"):
		self.move_left_right(+delta)
