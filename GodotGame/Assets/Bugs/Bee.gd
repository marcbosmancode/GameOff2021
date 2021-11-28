extends Area2D

var new_dialogue = ["oh, you got it!",
	"did that fix the\njumping bug we had?",
	"wow, looks like it!\nthanks for all your\nhelp!"]

func _ready():
	Globals.bugs_left += 1
	Globals.jump_bugged = true

func _on_Bee_area_entered(area):
	Globals.jump_bugged = false
	var ds = get_tree().get_current_scene().get_node_or_null("CanvasLayer/DialogueSystem")
	if ds != null:
		if Globals.got_bee == false:
			ds.dialogue = new_dialogue
			Globals.got_bee = true
	Globals.remove_bugs(1)
	queue_free()
