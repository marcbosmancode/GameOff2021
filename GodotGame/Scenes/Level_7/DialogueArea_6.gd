extends Area2D

var area_triggered = false

var new_dialogue = ["this is the last\narea!\njust one more bug\nto catch.",
	"i think it's all\nthe way up there.\nthanks for everything\nyou have done so far!",
	"good luck catching\nthe last one!"]

func _on_HelpArea_body_entered(body):
	if area_triggered == true:
		return
	area_triggered = true
	var ds = get_tree().get_current_scene().get_node("CanvasLayer/DialogueSystem")
	ds.dialogue = new_dialogue
