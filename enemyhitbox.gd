extends Area2D

var attackdamage = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = Vector2(50,50)
	attackdamage = 10
	#attackdamage = get_parent().attackdamage
