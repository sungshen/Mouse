extends Area2D

var attackdamage = 0
var enemy = enemy.enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy = enemy.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	enemy = enemy.enemy
	position = Vector2(50,50)
        attackdamage = enemy.attackdamage
