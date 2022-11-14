extends StaticBody2D

class_name NPC

onready var screen:Control=get_node("/root/Main/Screen/UI")
onready var player=get_node("/root/Main/Player")

var nearPlayer:bool=false

func interactPressed():
	var pos=position-player.position
	if abs(pos.x)>abs(pos.y):
		if pos.x>0:
			pos.x=1
		if pos.x<0:
			pos.x=-1
		pos.y=0
	else:
		if pos.y>0:
			pos.y=1
		if pos.y<0:
			pos.y=-1
		pos.x=0
	
	if nearPlayer && pos==player.direction:
		screen.toCutscene()

func _ready():
	InputProcess.connect("interact_pressed_outside_cutscene",self,"interactPressed")

func _on_Area2D_body_entered(body):
	if((body is KinematicBody2D)&&(body as KinematicBody2D).name=="Player"):
		nearPlayer=true

func _on_Area2D_body_exited(body):
	nearPlayer=false
