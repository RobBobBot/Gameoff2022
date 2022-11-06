extends Control

func toCutscene():
	Stats.inCutscene=true
	get_node("DialogWindow").visible=true
	var tween:Tween=get_node("DialogWindow/Tween")
	tween.interpolate_property(get_node("DialogWindow/HBoxContainer/Label"),"percent_visible",0,1,1)
	tween.start()

func _process(delta):
	if Stats.inCutscene&&Input.is_action_just_pressed("interact"):
		Stats.inCutscene=false
		get_node("DialogWindow").visible=false
