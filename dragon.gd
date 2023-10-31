extends enemy

@onready var animation = $AnimatedSprite2D

func _ready():
	Player.nodes.append(self)
	player = Player.new()
	HP = 5

func _physics_process(delta):
	if(HP < 0):
		death()
	player = Player.player
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
	if(player.attackdamage > 0):
		HP -= player.attackdamage
		await get_tree().create_timer(0.1).timeout
	if(player.attackey == 30 && Countable == true):
		HP *= 4/5
		Countable == false
		delay = true
		await get_tree().create_timer(15).timeout
		delay = false
