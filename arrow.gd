extends CharacterBody2D

var player = Player.player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = Player.new()

var dir = Vector2.ZERO
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = 1000*dir
	move_and_slide()
	dir = (player.position * delta - position * delta).normalized()
