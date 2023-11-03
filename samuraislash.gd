extends CollisionShape2D
		


func _on_samurai_dash():
	await get_tree().create_timer(0.4).timeout
	position = Vector2.ZERO
	scale = Vector2.ZERO


func _on_samurai_downslash():
	await get_tree().create_timer(0.4).timeout
	scale = Vector2(2,1)
	position = Vector2(0,202)


func _on_samurai_hekilekiisen(dir):
	await get_tree().create_timer(0.4).timeout
	scale = Vector2(8,0.1)
	rotation_degrees = atan2(dir.y,dir.x) * 180 / PI
	position = Vector2.ZERO

func _on_samurai_jump():
	await get_tree().create_timer(0.4).timeout
	scale = Vector2(0.7,0.7)
	position = Vector2.ZERO

func _on_samurai_sideslash(dir):
	await get_tree().create_timer(0.4).timeout
	scale = Vector2(1,1)
	position = Vector2(dir*202,0)

func _on_samurai_upslash():
	await get_tree().create_timer(0.4).timeout
	scale = Vector2(2,1)
	position = Vector2(0,-202)

func _on_samurai_counter():
	scale = Vector2(2,2)
	position = Vector2.ZERO

func _on_samurai_discardhitbox():
	rotation_degrees = 0
	position = Vector2.ZERO
	scale = Vector2.ZERO
