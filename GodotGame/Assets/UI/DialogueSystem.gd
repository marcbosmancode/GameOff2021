extends Control

export var TEXT_SPEED = 0.05

onready var text_label = $Text
onready var text_delay_timer = $TextDelayTimer
onready var tween = $Tween

var visible_characters = 0
var current_phrase = 0
var text_finished = false
var text = "" setget set_text

var dialogue = [""] setget set_dialogue

func _ready():
	if Globals.showDialogueControls == true:
		$ControlsIndication.show()
	text_delay_timer.start(TEXT_SPEED)
	modulate.a = 0

func _input(event):
	if Input.is_action_just_pressed("dialogue_skip"):
		#Remove the dialogue control indication
		if Globals.showDialogueControls == true:
			Globals.showDialogueControls = false
			#AAAAAAAAAAAAAAAAA TWEENS ARE AWESOME
			tween.interpolate_property($ControlsIndication, "modulate",
				Color(1,1,1,1), Color(1,1,1,0), 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			tween.start()
		
		#Move to the next phrase
		if visible_characters <= dialogue[current_phrase].length() - 1:
			visible_characters = dialogue[current_phrase].length()
			return
		if current_phrase < dialogue.size() - 1:
			current_phrase += 1
			set_text(dialogue[current_phrase])
		elif text_finished == false:
			text_finished = true
			tween.interpolate_property(self, "modulate",
				Color(1,1,1,1), Color(1,1,1,0), 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			tween.start()

func _process(delta):
	text_label.visible_characters = visible_characters
	text_label.text = text

func set_text(new_text):
	visible_characters = 0
	text = new_text
	text_delay_timer.start(TEXT_SPEED)

func set_dialogue(new_dialogue):
	show()
	dialogue = new_dialogue
	current_phrase = 0
	visible_characters = 0
	text_finished = false
	set_text(dialogue[0])
	if modulate.a != 1:
		tween.interpolate_property(self, "modulate",
			Color(1,1,1,0), Color(1,1,1,1), 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

func _on_TextDelayTimer_timeout():
	visible_characters += 1

