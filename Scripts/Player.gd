extends KinematicBody2D

var moving:bool = false
var last=0
var vel
onready var map: TileMap = get_node("/root/Main/MainMap")
onready var tween:Tween=get_node("/root/Main/MovementTween")

func move(val):
	move_and_collide(vel*(val-last))
	last=val

func _physics_process(delta):
	if Stats.inCutscene:
		return
		
	if Stats.playerVelocity!=Vector2()&&!moving:
		vel=Stats.playerVelocity
		moving=true
		tween.interpolate_method(self,"move",0,1,0.1)
		tween.start()

func _on_MovementTween_tween_all_completed():
	moving=false
	last=0
