extends enemy

@onready var animation = $AnimatedSprite2D

func _ready():
	ready():
	patternvarious = 3
	HP = 500
	

func _physics_process(delta):
	physics_process(delta):
		
func pattern(a):
	match a:
		0:
			Countable == false
		1:
			Countable == false
		2:
			Countable == false
		3:
			Countable == true

func _on_heartbox_area_entered(area):
	on_heartbox_area_entered(area):
