extends Spatial

func _input(event: InputEvent):
	if event.is_action_pressed("action_flashlight"):
		self.set_visible(!self.visible)
		
		$Sound.pitch_scale = 1.1 if self.visible else 0.9
		$Sound.play()
