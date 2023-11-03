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
var fight = false

signal discardhitbox


func _ready():
	Player.nodes.append(self)
	player = Player.new()
	Enemy.enemy = self
	position = clamp(position,Vector2(-5375,-3025),Vector2(5375,3025))

func _physics_process(delta):
	randomize()
	if (sqrt(pow(player.position.x-position.x,2) + pow(player.position.y-position.y,2)) < 1000):
		fight = true
	
	if fight == false:
		delay = true
	
	enemy = Enemy.enemy
	player = Player.player
	if(delay == false && grogi == false && fight == true):
		selectedpattern = randi_range(1,patternvarious)
		while(selectedpattern == currentpattern):
			selectedpattern = randi_range(1,patternvarious)
		pattern(selectedpattern)
		delay = true
		await get_tree().create_timer(1.5).timeout

	move_and_collide(velocity*delta)

func _on_hurtbox_area_entered(area):
	if(player.attackdamage > 0):
		HP -= player.attackdamage
		if(player.attackey == 30):
			player.cam.shake_amount = 15
		else:
			player.cam.shake_amount = 5
		await get_tree().create_timer(0.1).timeout
		player.cam.shake_amount = 0
	if(player.attackey == 30 && Countable == true):
		HP -= maxHP/20
		grogi = true
		pattern(0)
		await get_tree().create_timer(5).timeout
		grogi = false
	
	if(HP <= 0 && die == false):
		death()

func death():
	player.HP = player.maxHP
	grogi = true
	die = true
	selectedpattern = 0
	player.cam.shake_amount = 15
	await get_tree().create_timer(1).timeout
	player.cam.shake_amount = 0
	Player.nodes.pop_at(Player.nodes.find(self))

func pattern(a):
	emit_signal("discardhitbox")
	currentpattern = a
