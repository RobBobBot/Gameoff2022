extends Node

export var movementSpeed : float = 32;

signal interact_pressed_outside_cutscene
signal interact_pressed_inside_cutscene

func _process(delta):
	
	Stats.playerVelocity=Vector2()
	
	if Input.is_action_pressed("move_down"):
		if Stats.playerVelocity==Vector2():
			Stats.playerVelocity.y+=movementSpeed
	if Input.is_action_pressed("move_up"):
		if Stats.playerVelocity==Vector2():
			Stats.playerVelocity.y-=movementSpeed
	if Input.is_action_pressed("move_right"):
		if Stats.playerVelocity==Vector2():
			Stats.playerVelocity.x+=movementSpeed
	if Input.is_action_pressed("move_left"):
		if Stats.playerVelocity==Vector2():
			Stats.playerVelocity.x-=movementSpeed
			
	if Input.is_action_just_pressed("interact"):
		if Stats.inCutscene:
			emit_signal("interact_pressed_inside_cutscene")
		else:
			emit_signal("interact_pressed_outside_cutscene")
	
