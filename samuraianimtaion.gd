extends AnimatedSprite2D
var samurai = Samurai.samurai
var direction
# Called when the node enters the scene tree for the first time.
func _ready():
	samurai = Samurai.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction =  samurai.player.position * scale.x - position * delta 
	samurai = Samurai.samurai


func _on_samurai_hekilekiisen():	
	scale.x  = -abs(direction.x)/direction.x

func _on_samurai_sideslash():
	scale.x  = -abs(direction.x)/direction.x


func _on_samurai_dash():
	scale.x  = -abs(direction.x)/direction.x
