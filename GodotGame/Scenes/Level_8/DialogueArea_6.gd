extends Area2D

var area_triggered = false

var new_dialogue = ["this is the last\narea!\njust a few more bugs\nto catch.",
	"you need to use\neverything you\nlearned so far.",
	"good luck catching\nthem!"]

func _on_HelpArea_body_entered(body):
	if area_triggered == true:
		return
	area_triggered = true
	var ds = get_tree().get_current_scene().get_node("CanvasLayer/DialogueSystem")
	ds.dialogue = new_dialogue
