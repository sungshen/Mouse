extends CollisionShape2D

var player = Player.player

func _ready():
	player = Player.new()


func _process(delta):
	player = Player.player
	scale.x = player.HitboxLength
	scale.y = player.HitboxWidth 
	position = player.attackdir * ((10*scale.x) + 85) 
	rotation_degrees = atan2(player.attackdir.y,player.attackdir.x) * 180 / PI
	
