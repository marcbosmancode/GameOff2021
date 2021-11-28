extends Area2D

var new_dialogue = ["oh, you got it!",
	"are the fake walls\nnow working\nproperly?",
	"awesome! all the fake\nwalls should turn\ntransparent when\nyou walk through."]

func _ready():
	Globals.bugs_left += 1
	Globals.transparency_bugged = true

func _on_Butterfly_area_entered(area):
	Globals.transparency_bugged = false
	var ds = get_tree().get_current_scene().get_node_or_null("CanvasLayer/DialogueSystem")
	if ds != null:
		if Globals.got_butterfly == false:
			ds.dialogue = new_dialogue
			Globals.got_butterfly = true
	Globals.remove_bugs(1)
	queue_free()
