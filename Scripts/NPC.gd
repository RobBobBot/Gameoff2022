extends StaticBody2D

class_name NPC

onready var screen:Control=get_node("/root/Main/Screen/UI")

var nearPlayer:bool=false

func interactPressed():
	if nearPlayer:
		screen.toCutscene()

func _ready():
	InputProcess.connect("interact_pressed_outside_cutscene",self,"interactPressed")

func _on_Area2D_body_entered(body):
	if((body is KinematicBody2D)&&(body as KinematicBody2D).name=="Player"):
		nearPlayer=true

func _on_Area2D_body_exited(body):
	nearPlayer=false
