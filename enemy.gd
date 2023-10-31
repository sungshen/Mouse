class_name enemy

extends CharacterBody2D

static var Enemy :enemy
var HP = 10
var delay = false
var player = Player.player
var attackdamage = 0
var Countable = true
var patternvarious = 0

func ready():
	Player.nodes.append(self)
	player = Player.new()
	Enemy = self

func physics_process(delta):
	Enemy = Enemy.Enemy
	if(HP < 0):
		death()
	player = Player.player
	if(delay == false):
		pattern(randi_range(0,patternvarious))
		delay == true
		await get_tree().create_timer(1).timeout
		delay == false

func on_heartbox_area_entered(area):
	if(player.attackdamage > 0):
		HP -= player.attackdamage
		await get_tree().create_timer(0.1).timeout
	if(player.attackey == 30 && Countable == true):
		HP *= 9/10
		delay = true
		await get_tree().create_timer(15).timeout
		delay = false

func death():
	Player.nodes.pop_at(Player.nodes.find(self))
	queue_free()
