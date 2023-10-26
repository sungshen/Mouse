extends Sprite2D

var player = Player.player

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = Player.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player = Player.player
	if(player.target == null):
		position = player.position
	else:
		position = player.target.position
	
