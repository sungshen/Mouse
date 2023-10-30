class_name enemy

extends CharacterBody2D

static var enemy :enemy
var HP = 10
var delay = false
var player = Player.player
var attackdamage = 0
var Countable = true

func _ready():
	Player.nodes.append(self)
	player = Player.new()
	enemy = self

func _physics_process(delta):
	if(HP < 0):
		death()
	player = Player.player

func _on_heartbox_area_entered(area):
	if(player.attackdamage > 0):
		HP -= player.attackdamage
		await get_tree().create_timer(0.1).timeout
	if(player.attackey == 30 && Countable == true):
		delay = true
		await get_tree().create_timer(15).timeout
		delay = false

func death():
	Player.nodes.pop_at(Player.nodes.find(self))
	queue_free()
