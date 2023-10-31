extends Enemy
class_name Dragon
static var dragon: Dragon

@onready var animation = $AnimatedSprite2D

signal lazorcircle
signal breath
signal lazor
signal thunder

func _ready():
	Dragon.dragon = self
	ready()
	patternvarious = 4
	HP = 1500
	maxHP = 1500
	attackdamage = 10
	

func _physics_process(delta):
	physics_process(delta)
	
	
	
		
func pattern(a):
	match a:
		0:
			Countable == false
			emit_signal("lazorcircle")
		1:
			animation.play("dol")
			Countable == true
			await get_tree().create_timer(3).timeout
			emit_signal("lazorcircle")
			await get_tree().create_timer(3).timeout
			emit_signal("lazorcircle")
			await get_tree().create_timer(3).timeout
			emit_signal("lazorcircle")
			delay = false
		2:
			position = player.position + Vector2(-1000,-1000)
			animation.play("idle")
			Countable == false
			await get_tree().create_timer(2).timeout
			emit_signal("breath")
			await get_tree().create_timer(3).timeout
			delay = false
			
		3:
			animation.play("idle")
			Countable == false
			await get_tree().create_timer(1).timeout
			emit_signal("breath")
			await get_tree().create_timer(3).timeout
			delay = false
		4:
			position = player.position - Vector2(-1000,-1000)
			animation.play("dol")
			Countable == true
			await get_tree().create_timer(1).timeout
			emit_signal("lazorcircle")
			await get_tree().create_timer(3).timeout
			emit_signal("lazorcircle")
			await get_tree().create_timer(3).timeout
			emit_signal("lazorcircle")
			delay = false
			
			

func _on_heartbox_area_entered(area):
	on_heartbox_area_entered(area)

func death():
	animation.play("dol")
	delay = true
