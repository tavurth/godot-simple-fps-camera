extends Label

func _ready():
	set_process(true)
	
func _process(delta):
	self.text = 'FPS: ' + str(Engine.get_frames_per_second())