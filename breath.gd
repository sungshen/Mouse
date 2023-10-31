extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale.y = clamp(scale.y,0,3)
	scale.y -= delta
	if(scale.y<0.01):
		scale = Vector2.ZERO

func _on_dragon_breath():
	scale = Vector2(1,3)
