extends Area2D

func _on_Spider_area_entered(area):
	Globals.bugged = false
	queue_free()
