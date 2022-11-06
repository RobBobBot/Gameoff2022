extends KinematicBody2D

export var movementSpeed : int = 5;
var moving:bool = false
onready var map: TileMap = get_node("/root/Main/MainMap")

func move(vec: Vector2):
	var coll=move_and_collide(vec,false)
	if coll:
		var collided=instance_from_id(coll.collider_id)
		if collided.get_class()=="StaticBody2D":
			collided.call("collideedWithPlayer")

func _physics_process(delta):
	var vel = Vector2(0,0)
	
	if Stats.inCutscene:
		return
	
	if Input.is_action_pressed("move_down"):
		vel.y+=movementSpeed
	elif Input.is_action_pressed("move_up"):
		vel.y-=movementSpeed
		
	elif Input.is_action_pressed("move_right"):
		vel.x+=movementSpeed
		
	elif Input.is_action_pressed("move_left"):
		vel.x-=movementSpeed
	
	#vel = vel.normalized()

	move(vel)
