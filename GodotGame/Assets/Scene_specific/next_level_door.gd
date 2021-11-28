extends Sprite

var door_active = false setget set_door_active
export(String) var next_level_path = "res://Scenes/Titlescreen.tscn"

var new_dialogue = ["this path is blocked!\ncatch all the bugs\nfirst!"]

var door_loaded = false

func _ready():
	if door_active == false:
		modulate.a = 0.3
	#this somehow fixes the door dialogue from appearing on scene load
	#if it works it works
	yield(get_tree().create_timer(1.0), "timeout")
	door_loaded = true

func set_door_active(new_state):
	door_active = new_state
	if door_active == true:
		modulate.a = 1
	else:
		modulate.a = 0.3

func _on_Area2D_body_entered(body):
	if door_active == true:
		Globals.bugs_left = 0
		get_tree().change_scene(next_level_path)
	if door_active == false and door_loaded == true:
		#this triggers upon scene load somehow?
		var ds = get_tree().get_current_scene().get_node_or_null("CanvasLayer/DialogueSystem")
		if ds != null:
			ds.dialogue = new_dialogue
