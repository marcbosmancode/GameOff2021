extends Button

func _on_Button_pressed():
	Globals.bugs_left = 0
	get_tree().reload_current_scene()
