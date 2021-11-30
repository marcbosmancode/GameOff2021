extends Button

onready var mobileControls = preload("res://Assets/UI/MobileControls/MobileControls.tscn")

func _on_MobileControlsButton_pressed():
	if get_node_or_null("/root/MobileControls") == null:
		get_node("/root").add_child(mobileControls.instance())
	else:
		get_node("/root/MobileControls").queue_free()
