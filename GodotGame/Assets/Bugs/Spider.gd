extends Area2D

var new_dialogue = ["oh, you got it!",
	"did that fix the\nmovement bugs we\nhad?",
	"wow, looks like it!\nyou have to help me\ncatch more bugs!",
	"let's move further\ninto the forest!"]

func _on_Spider_area_entered(area):
	Globals.bugged = false
	var ds = get_tree().get_current_scene().get_node("CanvasLayer/DialogueSystem")
	ds.dialogue = new_dialogue
	queue_free()
