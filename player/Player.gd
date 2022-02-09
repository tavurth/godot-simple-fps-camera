extends KinematicBody

var velocity = Vector3(0, 0, 0)
var direction = Vector3(0, 0, 0) # Used for animation

const JUMP = 4
const PLAYER_MOVE_SPEED = 4

onready var Camera = $Camera
onready var GRAVITY = ProjectSettings.get("physics/3d/default_gravity") / 1000
onready var animation_tree = $character/AnimationTree

func move_forward_back(in_direction: int):
	"""
	Move the camera forward or backwards
	"""
	self.direction.z += in_direction
	self.velocity += get_transform().basis.z * in_direction * PLAYER_MOVE_SPEED

func move_left_right(in_direction: int):
	"""
	Move the camera to the left or right
	"""
	self.direction.x += in_direction
	self.velocity += get_transform().basis.x * in_direction * PLAYER_MOVE_SPEED

func blend_animations():
	animation_tree["parameters/run/blend_position"] = -direction.z
	animation_tree["parameters/strafe/blend_position"] = direction.x

func _process(_delta: float):
	"""
	Allow the player to move the camera with WASD
	See Project settings -> Input map for keyboard bindings
	"""
	# Preserve the Y velocity from the previous frame
	self.velocity = Vector3(0, self.velocity.y, 0)
	self.direction = Vector3(0, 0, 0)
	
	if Input.is_action_pressed("ui_up"):
		self.move_forward_back(-1)

	elif Input.is_action_pressed("ui_down"):
		self.move_forward_back(+1)

	if Input.is_action_pressed("ui_left"):
		self.move_left_right(-1)

	elif Input.is_action_pressed("ui_right"):
		self.move_left_right(+1)

func _physics_process(_delta: float):
	var snap_vector = Vector3(0, -1, 0)
	
	if Input.is_action_just_pressed("action_jump"):
		if self.is_on_floor():
			self.velocity.y += JUMP
			# Disable snap to floor for the jumping frame
			snap_vector = Vector3(0, 0, 0)
	
	# Apply less gravity if we were on the floor last frame
	# This helps our KinematicBody to avoid physics jitter
	if self.is_on_floor():
		self.velocity -= Vector3(0, GRAVITY / 100, 0)
	else:
		self.velocity -= Vector3(0, GRAVITY, 0)

	# Play the run/strafe/idle animation
	self.blend_animations()

	self.velocity = self.move_and_slide_with_snap(
		self.velocity,
		snap_vector,
		Vector3(0, +1, 0),
		true
	)
