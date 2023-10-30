extends Area2D

var attackdamage = 0
var Enemy = enemy.Enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	Enemy = enemy.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Enemy = enemy.Enemy
	position = Vector2(50,50)
        attackdamage = enemy.attackdamage
