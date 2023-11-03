extends AnimatedSprite2D
var samurai = Samurai.samurai
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	samurai = Samurai.new()
	scale.x = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	samurai = Samurai.samurai
	if samurai.position.x > samurai.player.position.x:
		direction = -1 
	else :
		direction = 1

	if(samurai.currentpattern == 1 ||samurai.currentpattern == 3):
		scale.x  = direction

func _on_samurai_sideslash(dir):
	scale.x  = dir/abs(dir)

func _on_samurai_jump():
	scale.x  = direction
