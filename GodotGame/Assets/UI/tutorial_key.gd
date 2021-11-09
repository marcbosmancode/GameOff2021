extends Sprite

var key_pressed = false

export(String) var corresponding_key = "ui_right"

func _process(delta):
	if key_pressed == false:
		if Input.is_action_just_pressed(corresponding_key):
			key_pressed = true
	else:
		modulate.a -= delta
		if modulate.a <= 0:
			queue_free()
