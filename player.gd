class_name Player
extends CharacterBody2D

static var player: Player
static var node: Node
static var nodes: Array[Node] = []

const SPEED = 50
const MAXSPEED = 1000.0

var HP = 100

var Weapon = [['도끼','검','단검','블라스타','화염방사기','성신의 손톱'],[1,2,3,4,5,6],[2,4,6,8,10,12],[5,1,2,2,3,3,4,4],[1,3,2,1,5,1],[1,1,2,2,3,3,4,4],[3,3,2,1,5,1],[1,1,1,1,1,5],[1,2,2,2,3,1],[80,1,1,1,1,5],[20,2,2,2,3,1]]
var EquipedWeapon = '도끼'

var AItems = {"포션":1}
var PItems = {"검":1,"블라스타":2}
var icons = "res://Sprite/Icons/Items"

var Item = []
var ActiveItem = ["포션"]

var SelectItem = 0

var attackdir
var HitboxLength = 0
var HitboxWidth = 0
var attackdamage = 0

var attackey = 0

var attack
var rolling = false

var status = [] #무기이름 약공뎀 강공뎀 약공범위길이 강공범위길이 약공선후딜 강공선후딜
var item = []

var delay = false
var target

var cam = Cam.cam

func _enter_tree():
	for i in range(11):
		status.append(Weapon[i][Weapon[0].find(EquipedWeapon)])
	for i in Item:
		passive(i)
	print(status)

func sum(arr:Array):
	var result = Vector2.ZERO
	for i in arr:
		result+=i.position
	return result
	
func targeting(arr:Array):
	var result = []
	for i in arr:
		result.append(distance(i.position,position))
	return result
	
func loop(a,b):
	if(a == -1):
		return b
	elif(a == b+1):
		return 0
	else:
		return a
	

func _ready(): 
	Player.player = self
	cam = Cam.new()
	
@onready var animationPlayer = $AnimatedSprite2D

func distance(first:Vector2,second:Vector2):
	var answer = sqrt(pow(first.x-second.x,2) + pow(first.y-second.y,2))
	return answer

func _physics_process(delta):
	var direction =  get_local_mouse_position() - position * delta
	var distance = sqrt(pow(direction.x,2) + pow(direction.y,2))

	player = Player.player
	distance(cam.position*delta,position*delta)
	if(distance(position,(sum(nodes)+position)/(len(nodes)+1)) > 2000):
		cam.position = Vector2.ZERO
	else:
		cam.position = (sum(nodes)+position)/(len(nodes)+1) - position
		cam.zoom = Vector2(sqrt(sqrt(50/distance(cam.position,Vector2.ZERO))), sqrt(sqrt(50/distance(cam.position,Vector2.ZERO))))
		cam.zoom = clamp(cam.zoom,Vector2(0.3,0.3),Vector2(1,1))
		
	cam = Cam.cam

	SelectItem += int(Input.is_action_just_pressed("휠업")) - int(Input.is_action_just_pressed("휠다운"))
	
	SelectItem = loop(SelectItem,len(ActiveItem))
	
	if SelectItem != 0:
		if Input.is_action_just_pressed("아이템 사용"):
			active(ActiveItem[SelectItem-1])
	
	attackey = clamp(attackey,0,30)
	move_and_slide()
	

	
	if delay == true:
		pass
	else:	
		direction =  get_local_mouse_position() - position * delta 
		if distance > 10:
			animationPlayer.play("run")
			velocity = direction.normalized() * clamp(1.5*distance,SPEED,MAXSPEED)
		else :
			animationPlayer.play("idle")
			velocity = Vector2.ZERO
			
		
		if(len(nodes) != 0 && targeting(nodes).min() < 1000):
			target = nodes[targeting(nodes).find(targeting(nodes).min())]
			attackdir = ((target.position - position)*delta).normalized()
		else:
			attackdir = direction.normalized()
			target = null
		
		
			
		if Input.is_action_just_pressed("구르기"):
			delay = true
			animationPlayer.play("roll")
			attackey = 0
			velocity = 1450*direction.normalized()
			await get_tree().create_timer(0.1).timeout
			velocity.move_toward(Vector2.ZERO,delta*300)
			await get_tree().create_timer(0.05).timeout
			velocity = Vector2.ZERO
			await get_tree().create_timer(0.5).timeout
			delay = false
		
		if Input.is_action_just_pressed("공격"):
			attack = true
		
		if attack == true:
			attackey += Input.get_action_strength("공격")
			if Input.is_action_just_released("공격") || attackey == 30:
				velocity = Vector2.ZERO
				delay = true
				if attackey != 30:
					attackdamage = status[1]
					animationPlayer.play("attack")
					await get_tree().create_timer(status[7]/60).timeout
					HitboxLength = status[3]
					HitboxWidth = status[4]
					await get_tree().create_timer(0.1).timeout
					HitboxLength = 0
					HitboxWidth = 0
					await get_tree().create_timer(status[8]/60).timeout
				else:
					attackdamage = status[2]
					animationPlayer.play("strongattack")
					await get_tree().create_timer(status[9]/60).timeout
					HitboxLength = status[5]
					HitboxWidth = status[6]
					await get_tree().create_timer(0.1).timeout
					HitboxLength = 0
					HitboxWidth = 0
					await get_tree().create_timer(status[10]/60).timeout
			
				attackey = 0
				delay = false
				attack = false
				attackdamage = 0

			
func active(a):
	match AItems[a]:
		1:
			HP += 10
		2:
			HP -= 10
			
	load(icons + '/' + a + '.png')
		
func passive(a):
	match PItems[a]:
		1:
			HP += 10
		2:
			HP -= 10



func _on_area_2d_2_area_entered(area):
	HP -= area.attackdamage
