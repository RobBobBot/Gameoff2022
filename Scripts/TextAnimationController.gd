extends Label

func _ready():
	percent_visible=0

func _on_Tween_tween_completed(object, key):
	percent_visible=1
