extends StaticBody2D

onready var screen:Control=get_node("/root/Main/Screen/UI")

func collideedWithPlayer():
	if Input.is_action_pressed("interact"):
		screen.toCutscene()
	
