extends Sprite2D

var player = player.player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = Player.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player = player.player
	name = player.aitem[loop(player.selectitem-1,player.len(aitem))]
	load(player.icon)

func loop(a,b):
	if(a == -1):
		return b
	elif(a == b+1):
		return 0
	else:
		return a