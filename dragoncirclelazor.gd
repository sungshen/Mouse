extends CollisionPolygon2D

@onready var animation = $circle
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animation.play('default')
	scale += Vector2(delta,delta)

func _on_dragon_lazorcircle():
	scale = Vector2.ZERO
		
	
