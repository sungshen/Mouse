class_name enemy

extends CharacterBody2D

var HP = 50
var delay = false
var player = Player.player
var attackdamage = 0
var death = false

func _ready():
	Player.nodes.append(self)
	player = Player.new()


func _physics_process(delta):
	if(!death):
		Player.nodes[Player.nodes.find(self)] = self
	player = Player.player

func _on_heartbox_area_entered(area):
	if(player.attackdamage > 0):
		death = true
		Player.nodes.pop_at(Player.nodes.find(self))
		queue_free()
