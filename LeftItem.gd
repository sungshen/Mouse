extends Sprite2D

var player = player.player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = Player.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player = player.player
	load(player.icons + '/' + player.ActiveItem[loop(player.SelectItem-1,player.len(ActiveItem))] + '.png')

func loop(a,b):
	if(a == -1):
		return b
	elif(a == b+1):
		return 0
	else:
		return a
