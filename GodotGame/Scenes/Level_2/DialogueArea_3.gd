extends Area2D

var area_triggered = false

var new_dialogue = ["oh?\nthe bug came back?\nand there is\nanother one?!?!",
	"atleast this one is\nright there...\ni was working on\nsome fake walls.",
	"you should be able\nto go right through!"]

func _on_HelpArea_body_entered(body):
	if area_triggered == true:
		return
	area_triggered = true
	var ds = get_tree().get_current_scene().get_node("CanvasLayer/DialogueSystem")
	ds.dialogue = new_dialogue
