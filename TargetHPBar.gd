extends ProgressBar

var player = Player.player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = Player.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player = Player.player
	if(player.target == null):
		hide()
	else :
		show()
		max_value = player.target.maxHP
		value = player.target.HP
	
