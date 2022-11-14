extends KinematicBody2D

var moving:bool = false
var last=0
var velocity
onready var map: TileMap = get_node("/root/Main/MainMap")
onready var tween:Tween=get_node("/root/Main/MovementTween")
onready var animation:AnimatedSprite=get_node("Animation")
var direction:Vector2

func move(val):
	move_and_collide(velocity*(val-last))
	last=val

func _physics_process(delta):
	if Stats.inCutscene:
		return
		
	if Stats.playerVelocity!=Vector2()&&!moving:
		velocity=Stats.playerVelocity
		get_direction(velocity)
		moving=true
		tween.interpolate_method(self,"move",0,1,0.1)
		tween.start()

func _on_MovementTween_tween_all_completed():
	moving=false
	last=0

func get_direction(velocity):
	direction=velocity.normalized()

func _process(delta):
	if moving:
		if direction.x==1:
			animation.animation="MoveRight"
		if direction.x==-1:
			animation.animation="MoveLeft"
		if direction.y==1:
			animation.animation="MoveDown"
		if direction.y==-1:
			animation.animation="MoveUp"
	else:
		if direction.x==1:
			animation.animation="IdleRight"
		if direction.x==-1:
			animation.animation="IdleLeft"
		if direction.y==1:
			animation.animation="IdleDown"
		if direction.y==-1:
			animation.animation="IdleUp"
