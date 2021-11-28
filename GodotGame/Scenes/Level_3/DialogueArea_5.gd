extends Area2D

var area_triggered = false

var new_dialogue = ["oh? you can't jump?\nthere's a restart\nbutton at the top\nleft of the screen.",
	"maybe try jumping\nwhile in the air?"]

func _on_HelpArea_body_entered(body):
	if area_triggered == true:
		return
	area_triggered = true
	var ds = get_tree().get_current_scene().get_node("CanvasLayer/DialogueSystem")
	ds.dialogue = new_dialogue
