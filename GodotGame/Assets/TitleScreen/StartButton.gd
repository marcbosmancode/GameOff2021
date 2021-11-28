extends Button

func _on_StartButton_pressed():
	Globals.swing_bugged = true
	Globals.transparency_bugged = true
	Globals.showDialogueControls = true
	Globals.got_butterfly = false
	Globals.got_spider = false
	Globals.got_bee = false
	get_tree().change_scene("res://Scenes/Level_1/Level_1.tscn")
