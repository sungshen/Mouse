extends enemy

@onready var animation = $AnimatedSprite2D

func _ready():
	ready():

func _physics_process(delta):
	physics_process(delta):
	if(delay == false):
		pattern(randi_range(0,5))
		delay == true
		await get_tree().create_timer(1).timeout
		delay == false
		
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
