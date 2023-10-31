class_name Enemy

extends CharacterBody2D

static var enemy :Enemy
var HP = 10
var maxHP = 10
var delay = false
var player = Player.player
var attackdamage = 0
var Countable = false
var patternvarious = 0
var grogi = false

func ready():
	Player.nodes.append(self)
	player = Player.new()
	Enemy.enemy = self

func physics_process(delta):
	enemy = Enemy.enemy
	if(HP <= 0):
		death()
	player = Player.player
	if(delay == false):
		pattern(randi_range(1,patternvarious))
		delay = true
		await get_tree().create_timer(1).timeout

func on_heartbox_area_entered(area):
	if(player.attackdamage > 0):
		HP -= player.attackdamage
		await get_tree().create_timer(0.1).timeout
	if(player.attackey == 30 && Countable == true):
		HP -= maxHP/10
		grogi = true
		pattern(0)
		await get_tree().create_timer(15).timeout
		grogi = false

func death():
	pass
	#Player.nodes.pop_at(Player.nodes.find(self)) queue_free()

func pattern(a):
	pass
