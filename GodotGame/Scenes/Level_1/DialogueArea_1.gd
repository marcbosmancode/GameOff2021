extends Area2D

var area_triggered = false

var new_dialogue = ["hello!\nare you here to help\ntest my game?",
	"there are still a\nlot of bugs...\nlook over there!",
	"think you can catch\nit for me?"]

func _on_HelpArea_body_entered(body):
	if area_triggered == true:
		return
	area_triggered = true
	var ds = get_tree().get_current_scene().get_node("CanvasLayer/DialogueSystem")
	ds.dialogue = new_dialogue
