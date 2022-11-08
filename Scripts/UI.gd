extends Control

onready var tween:Tween=get_node("DialogWindow/Tween")
onready var text:Label=get_node("DialogWindow/HBoxContainer/Label")

func toCutscene():
	get_node("DialogWindow").visible=true
	tween.interpolate_property(text,"percent_visible",0,1,2)
	tween.start()
	Stats.inCutscene=true

func interactPressed():
	if tween.is_active():
		tween.emit_signal("tween_completed","text","")
		tween.remove(text)
	else:
		Stats.inCutscene=false
		get_node("DialogWindow").visible=false
	
func _ready():
	get_node("/root/InputProcess").connect("interact_pressed_inside_cutscene",self,"interactPressed")
