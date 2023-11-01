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
var currentpattern = 0
var selectedpattern
var die = false

func _ready():
	Player.nodes.append(self)
	player = Player.new()
	Enemy.enemy = self
	position = clamp(position,Vector2(),Vector2())

func _physics_process(delta):
	randomize()
	enemy = Enemy.enemy
	player = Player.player
	if(delay == false && grogi == false):
		selectedpattern = randi_range(1,patternvarious)
		while(selectedpattern == currentpattern):
			selectedpattern = randi_range(1,patternvarious)
		pattern(selectedpattern)
		delay = true
		await get_tree().create_timer(1).timeout

func _on_heartbox_area_entered(area):
	
	if(player.attackdamage > 0):
		HP -= player.attackdamage
		if(player.attackey == 30):
			player.cam.shake_amount = 15
		else:
			player.cam.shake_amount = 5
		await get_tree().create_timer(0.1).timeout
		player.cam.shake_amount = 0
	if(player.attackey == 30 && Countable == true):
		HP -= maxHP/10
		grogi = true
		pattern(0)
		await get_tree().create_timer(15).timeout
		grogi = false
	if(HP <= 0 && die == false):
		death()

func death():
	grogi = true
	die = true
	player.cam.shake_amount = 15
	await get_tree().create_timer(1).timeout
	player.cam.shake_amount = 0
	Player.nodes.pop_at(Player.nodes.find(self))

func pattern(a):
	currentpattern = a
