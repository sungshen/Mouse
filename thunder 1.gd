extends CollisionShape2D
class_name Thunder

var dragon = Dragon.dragon
var player = Player.player

# Called when the node enters the scene tree for the first time.
func _ready():
	dragon = Dragon.new()
	player = Player.new()
var delay = false

@onready var animationPlayer = $thunder

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dragon = Dragon.dragon
	player = Player.player
		
	if(delay == false):
		delay = true
		var pos = player.position
		animationPlayer.play('default')
		await get_tree().create_timer(0.5).timeout
		position = pos
		scale+=Vector2(1,1)
		await get_tree().create_timer(1).timeout
		delay = false
	
	if(scale.x > 4):
		scale = Vector2.ZERO
	
	if(dragon == null):
		queue_free()

func _on_area_2d_body_entered(body):
	player.HP -= 1
	player.current_stamina -= 10
