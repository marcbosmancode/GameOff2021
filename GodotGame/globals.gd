extends Node

var swing_bugged = false
var transparency_bugged = false
var jump_bugged = false
var showDialogueControls = true

var bugs_left = 0

#for dialogue the first time you get a bug
var got_spider = false
var got_butterfly = false
var got_bee = false

func remove_bugs(amount_to_reduce):
	bugs_left -= amount_to_reduce
	
	if bugs_left <= 0:
		var nld = get_tree().get_current_scene().get_node_or_null("next_level_door")
		if nld != null:
			nld.door_active = true
