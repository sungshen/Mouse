class_name Cam

extends Camera2D

static var cam: Cam

var player = Player.player


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = Player.new()
	Cam.cam = self
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
