extends Area2D
var irum


func _enter_tree():
	randomize()
	if randi_range(0,1) == 0:
		irum = randi_range(1,len(Inventory.AItems)-1)
		
	else:
		irum = randi_range(1,len(Inventory.PItems))
