class_name Cam

extends Camera2D

static var cam: Cam

var player = Player.player

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = Player.new()
	Cam.cam = self
	

	
var shake_amount = 0

func _process(delta):
	set_offset(Vector2(randf_range(-1.0, 1.0) * shake_amount,randf_range(-1.0, 1.0) * shake_amount))
