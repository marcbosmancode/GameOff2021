extends Area2D

var new_dialogue = ["oh, you got it!",
	"did that fix the\nmovement bugs we\nhad?",
	"wow, looks like it!\nyou have to help me\ncatch more bugs!",
	"let's head deeper\ninto the forest!"]

func _ready():
	Globals.bugs_left += 1
	Globals.swing_bugged = true

func _on_Spider_area_entered(area):
	Globals.swing_bugged = false
	var ds = get_tree().get_current_scene().get_node_or_null("CanvasLayer/DialogueSystem")
	if ds != null:
		if Globals.got_spider == false:
			ds.dialogue = new_dialogue
			Globals.got_spider = true
	Globals.remove_bugs(1)
	queue_free()
