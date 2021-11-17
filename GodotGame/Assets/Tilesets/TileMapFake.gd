extends TileMap

onready var tween = get_node("Tween")

func _on_Area2D_body_entered(body):
	tween.interpolate_property(self, "modulate",
		Color(1,1,1,1), Color(1,1,1,0.3), 0.3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func _on_Area2D_body_exited(body):
	tween.interpolate_property(self, "modulate",
		Color(1,1,1,0.3), Color(1,1,1,1), 0.3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
