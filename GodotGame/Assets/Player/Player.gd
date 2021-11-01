extends KinematicBody2D

export var ACCELERATION = 400
export var MAX_SPEED = 100
export var FRICTION = 10
export var AIR_RESISTANCE = 1
export var GRAVITY = 500
export var JUMP_FORCE = 200

var motion = Vector2.ZERO

var jump_allowed = false
var touching_ground = false

onready var c_timer = $CoyoteTimer

func _physics_process(delta):
	touching_ground = is_on_floor()
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if touching_ground:
		jump_allowed = true
		c_timer.start(0.05)
	
	if x_input != 0:
		motion.x += x_input * ACCELERATION * delta
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		
	motion.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("ui_up"):
		if jump_allowed:
			motion.y = -JUMP_FORCE
	
	if touching_ground:
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION * delta)
	else:
		if x_input == 0:
			motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta)
	
	motion = move_and_slide(motion, Vector2.UP)

func _on_CoyoteTimer_timeout():
	jump_allowed = false
