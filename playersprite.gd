extends AnimatedSprite2D

var player = Player.player

func _ready():
	player = Player.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player = Player.player
	var direction =  get_local_mouse_position() * scale.x - position * delta 
	if player.attack == true:	
		scale.x  = -abs(player.attackdir).x/player.attackdir.x
	
	elif abs(direction.x) > 10 && player.delay == false:
		scale.x  = -abs(direction.x)/direction.x
	

	
