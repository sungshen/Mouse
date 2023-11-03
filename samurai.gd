extends Enemy
class_name Samurai
static var samurai: Samurai
var reflect = false
var pos
var counterattack = false

@onready var animation = $AnimatedSprite2D

signal dash
signal upslash
signal downslash
signal hekilekiisen
signal counter
signal jump
signal sideslash

func _ready():
	super()
	if(delay == false):
		animation.play("idle")
		animation.set_frame_and_progress(0,0)
	Samurai.samurai = self
	patternvarious = 6
	HP = 1200
	maxHP = 1200
	
	
	

func _physics_process(delta):
	super(delta)
	if(sqrt(pow(player.position.x-position.x,2) + pow(player.position.y-position.y,2))>500):
		patternvarious = 3
	else:
		patternvarious = 6
		
	if(grogi == true):
		animation.play("grogi")
		
func pattern(a):
	super(a)
	
	match a:
		0:
			animation.play("grogi")
		1:
			Countable == false
			emit_signal("dash")
			pos = player.position + Vector2(randf_range(-250,250),randf_range(-250,250))
			velocity = (pos - position).normalized() * 1250
			await get_tree().create_timer(sqrt(pow(player.position.x-position.x,2) + pow(player.position.y-position.y,2))/2500 + 1/5).timeout
			velocity = Vector2.ZERO
			delay = false
		2:
			attackdamage = 30
			animation.play("jump")
			Player.nodes.pop_at(Player.nodes.find(self))
			hide()
			await get_tree().create_timer(2).timeout
			pos = player.position
			emit_signal("jump")
			await get_tree().create_timer(0.4).timeout
			position = pos
			show()
			Player.nodes.append(self)
			await get_tree().create_timer(0.2).timeout
			emit_signal("discardhitbox")
			Countable == false
			
			if(HP < maxHP/2):
				pattern(randi_range(1,patternvarious))
			
			animation.play("idle")
			await get_tree().create_timer(1).timeout
			delay = false
		3:
			await get_tree().create_timer(1).timeout
			attackdamage = 15
			animation.play("hekirekiisen")
			Countable == false
			pos = player.position
			emit_signal("hekilekiisen",(pos-position).normalized())
			await get_tree().create_timer(0.5).timeout
			position = pos + (pos-position).normalized() * 500
			await get_tree().create_timer(0.3).timeout
			emit_signal('discardhitbox')
			await get_tree().create_timer(0.4).timeout
			for i in range(randi_range(0,2)):
				pos = player.position
				emit_signal('discardhitbox')
				emit_signal("hekilekiisen",(player.position-position).normalized())
				await get_tree().create_timer(0.5).timeout
				position = pos + (pos-position).normalized() * 500
				await get_tree().create_timer(0.4).timeout
			emit_signal('discardhitbox')
			await get_tree().create_timer(1).timeout
			animation.play("idle")
			delay = false
		4:
			Countable = false
			attackdamage = 35
			counterattack = false
			animation.play("counter")
			reflect = true
			await get_tree().create_timer(1.5).timeout
			if(counterattack == false):
				reflect = false
				Countable = true
				animation.play("idle")
				await get_tree().create_timer(0.5).timeout
				delay = false
			
		5:
			attackdamage = 25
			Countable == false
			emit_signal("sideslash",(player.position.x-position.x)/abs((player.position.x-position.x)))
			await get_tree().create_timer(0.2).timeout
			animation.play("sideattack")
			await get_tree().create_timer(0.3).timeout
			velocity = (player.position - position).normalized() * 2000
			await get_tree().create_timer(0.1).timeout
			velocity = Vector2.ZERO
			emit_signal('discardhitbox')
			await get_tree().create_timer(0.3).timeout
			animation.play("idle")
			delay = false
		6:
			attackdamage = 25
			Countable == true
			if(player.position.y < position.y):
				emit_signal("upslash")
				await get_tree().create_timer(0.4).timeout
				animation.play("upslash")
			else:
				emit_signal("downslash")
				await get_tree().create_timer(0.4).timeout
				animation.play("downslash")
			await get_tree().create_timer(0.1).timeout
			emit_signal("discardhitbox")
			await get_tree().create_timer(0.5).timeout
			animation.play("idle")
			delay = false
		
		

func death():
	super()
	animation.play("grogi")
	


func _on_hurtbox_area_entered(area):
	super(area)
	if(reflect == true):
		emit_signal('counter')
		animation.play("conter_attack")
		await get_tree().create_timer(0.2).timeout
		emit_signal("discardhitbox")
		reflect = false
		counterattack = true
		animation.play("idle")
		await get_tree().create_timer(1).timeout
		delay = false
		
		
		
