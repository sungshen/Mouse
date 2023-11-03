extends Polygon2D

func _on_samurai_dash():
	position = Vector2.ZERO
	scale = Vector2.ZERO


func _on_samurai_downslash():
	scale = Vector2(8,0.1)
	position = Vector2(0,252)
	await get_tree().create_timer(0.2).timeout
	rotation_degrees = 0
	position = Vector2.ZERO
	scale = Vector2.ZERO

func _on_samurai_hekilekiisen(dir):
	scale = Vector2(8,0.1)
	rotation_degrees = atan2(dir.y,dir.x) * 180 / PI
	position = Vector2.ZERO
	await get_tree().create_timer(0.2).timeout
	rotation_degrees = 0
	position = Vector2.ZERO
	scale = Vector2.ZERO

func _on_samurai_jump():
	scale = Vector2(0.3,0.7)
	position = get_parent().pos - get_parent().position
	await get_tree().create_timer(0.2).timeout
	rotation_degrees = 0
	position = Vector2.ZERO
	scale = Vector2.ZERO

func _on_samurai_sideslash(dir):
	rotation_degrees = 90
	scale = Vector2(8,0.1)
	position = Vector2(dir*202,0)
	await get_tree().create_timer(0.2).timeout
	rotation_degrees = 0
	position = Vector2.ZERO
	scale = Vector2.ZERO

func _on_samurai_upslash():
	scale = Vector2(8,0.1)
	position = Vector2(0,-252)
	await get_tree().create_timer(0.2).timeout
	rotation_degrees = 0
	position = Vector2.ZERO
	scale = Vector2.ZERO


func _on_samurai_discardhitbox():
	rotation_degrees = 0
	position = Vector2.ZERO
	scale = Vector2.ZERO
