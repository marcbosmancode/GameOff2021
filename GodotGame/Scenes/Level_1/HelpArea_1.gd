extends Area2D

var area_triggered = false

var new_dialogue = ["oh? you can't reach\nup there?",
	"hmmmmm....\nlet me think.",
	"try using the f key.\nit makes you swing\nyour net.",
	"i remember the swing\nstate had some\nweird movement bugs."]

func _on_HelpArea_body_entered(body):
	if area_triggered == true:
		return
	area_triggered = true
	var ds = get_tree().get_current_scene().get_node("CanvasLayer/DialogueSystem")
	ds.dialogue = new_dialogue
