extends Enemy
class_name Samurai
static var samurai: Samurai
var reflect = false
var pos

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
	Samurai.samurai = self
	patternvarious = 6
	HP = 3000
	maxHP = 3000
	attackdamage = 30
	

func _physics_process(delta):
		super(delta)
		if(sqrt(pow(player.x-self.x,2) + pow(player.y-self.y,2))>500):
			patternvarious = 3
		else:
			patternvarious = 6
		
	
		
func pattern(a):
	super(a)
	
	match a:
		0:
			Countable == false
		1:
			Countable == true
			pos = player.position + Vector2(randf_range(-250,250),randf_range(-250,250))
			velocity = (pos - position).normalized() * 2500
			move_and_slide()
			await get_tree().create_timer(sqrt(pow(player.x-self.x,2) + pow(player.y-self.y,2))/2500 + 1/5).timeout
			delay = false
		2:
			animation.play("jump")
			await get_tree().create_timer(2).timeout
			position = player.position
			await get_tree().create_timer(0.5).timeout
			Countable == false
			emit_signal("jump")
			if(HP < maxHP/2):
				animation.play("hekirekiisen")
				velocity = (player.position - position).normalized() * 5000
				move_and_slide()
				emit_signal("hekilekiisen")
			await get_tree().create_timer(1).timeout
			delay = false
		3:
			animation.play("hekirekiisen")
			Countable == false
			emit_signal("hekilekiisen")
			await get_tree().create_timer(1).timeout
			for i in range(randi_range(0,2)):
				emit_signal("hekilekiisen")
				await get_tree().create_timer(0.5).timeout
			await get_tree().create_timer(1).timeout
			delay = false
		4:
			animation.play("counter")
			reflect = true
			await get_tree().create_timer(1).timeout
			reflect = false
			animation.play("idle")
			await get_tree().create_timer(2).timeout
			delay = false
			
		5:
			Countable == true
			emit_signal("sideslash")
		6:
			Countable == true
			if(player.position.y > position.y):
				emit_signal("upslash")
			else:
				emit_signal("downslash")
			
			

func _on_heartbox_area_entered(area):
	super(area)
	if(reflect == true):
		emit_signal('counter')
		animation.play("conter_attack")
		

func death():
	super()
	animation.play("dol")
	
