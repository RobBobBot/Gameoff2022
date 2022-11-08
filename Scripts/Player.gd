extends KinematicBody2D

var moving:bool = false
onready var map: TileMap = get_node("/root/Main/MainMap")

func move(vec: Vector2):
	move_and_collide(vec)

func _physics_process(delta):
	var vel = Vector2(0,0)
	
	if Stats.inCutscene:
		return

	move(Stats.playerVelocity)
