extends AnimatedSprite



func _on_Tween_tween_started(object, key):
	playing=true


func _on_Tween_tween_completed(object, key):
	frame=0;
	playing=false
	pass # Replace with function body.
