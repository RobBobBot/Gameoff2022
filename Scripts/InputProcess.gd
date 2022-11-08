extends Node

export var movementSpeed : float = 3.5;

signal interact_pressed_outside_cutscene
signal interact_pressed_inside_cutscene

func _process(delta):
	
	Stats.playerVelocity=Vector2()
	
	if Input.is_action_pressed("move_down"):
		Stats.playerVelocity.y+=movementSpeed
	if Input.is_action_pressed("move_up"):
		Stats.playerVelocity.y-=movementSpeed
	if Input.is_action_pressed("move_right"):
		Stats.playerVelocity.x+=movementSpeed
	if Input.is_action_pressed("move_left"):
		Stats.playerVelocity.x-=movementSpeed
	if Input.is_action_just_pressed("interact"):
		if Stats.inCutscene:
			emit_signal("interact_pressed_inside_cutscene")
		else:
			emit_signal("interact_pressed_outside_cutscene")
	
