extends Enemy
class_name Dragon
static var dragon: Dragon

@onready var animation = $AnimatedSprite2D

signal lazorcircle
signal breath
signal lazor
signal thunder

func _ready():
	super()
	Dragon.dragon = self
	patternvarious = 4
	HP = 1500
	maxHP = 1500
	attackdamage = 20
	

func _physics_process(delta):
	super(delta)
	
	
	
		
func pattern(a):
	super(a)
	
	match a:
		0:
			Countable == false
			emit_signal("lazorcircle")
		1:
			animation.play("dol")
			Countable == true
			attackdamage = 20
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
			await get_tree().create_timer(1).timeout
			attackdamage = 25
			emit_signal("breath")
			await get_tree().create_timer(3).timeout
			delay = false
			
		3:
			animation.play("idle")
			Countable == false
			await get_tree().create_timer(1).timeout
			attackdamage = 25
			emit_signal("breath")
			await get_tree().create_timer(3).timeout
			delay = false
		4:
			position = player.position - Vector2(-1000,-1000)
			animation.play("dol")
			Countable == true
			attackdamage = 20
			await get_tree().create_timer(1).timeout
			emit_signal("lazorcircle")
			await get_tree().create_timer(3).timeout
			emit_signal("lazorcircle")
			await get_tree().create_timer(3).timeout
			emit_signal("lazorcircle")
			delay = false
			
			

func _on_heartbox_area_entered(area):
	super(area)

func death():
	super()
	animation.play("dol")
	
