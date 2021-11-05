extends KinematicBody2D

export var ACCELERATION = 400
export var MAX_SPEED = 100
export var FRICTION = 10
export var AIR_RESISTANCE = 1
export var GRAVITY = 500
export var JUMP_FORCE = 220

var motion = Vector2.ZERO

var jump_allowed = false
var touching_ground = false

enum {
	MOVE,
	BUGGED_SWING,
	SWING
}

var state = MOVE

onready var c_timer = $CoyoteTimer
onready var sprite = $Sprite
onready var anim_player = $AnimationPlayer
onready var hitbox_pivot = $HitboxPivot

func _physics_process(delta):
	match state:
		MOVE:
			state_move(delta)
		BUGGED_SWING:
			state_bugged_swing(delta)
		SWING:
			state_swing(delta)

func state_move(delta):
	touching_ground = is_on_floor()
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if touching_ground:
		jump_allowed = true
		# Coyote timer to be able to jump a little while after leaving the ground
		c_timer.start(0.1)
	
	if x_input != 0:
		motion.x += x_input * ACCELERATION * delta
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		if x_input == 1:
			sprite.set_flip_h(false)
			hitbox_pivot.position.x = 0
		else:
			sprite.set_flip_h(true)
			# Haha magic numbers go brrrrrrr
			hitbox_pivot.position.x = -36
		
	motion.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("ui_up"):
		if jump_allowed:
			motion.y = -JUMP_FORCE
	
	if touching_ground:
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION * delta)
			anim_player.play("Idle")
		else:
			anim_player.play("Run")
	else:
		if x_input == 0:
			motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta)
		if motion.y <= 0:
			anim_player.play("Jump")
		else:
			anim_player.play("Fall")
	
	motion = move_and_slide(motion, Vector2.UP)
	
	if Input.is_action_just_pressed("swing"):
		if Globals.bugged:
			state = BUGGED_SWING
		else:
			state = SWING

func state_bugged_swing(delta):
	anim_player.play("Swing")
	motion = move_and_slide(motion, Vector2.UP)

func state_swing(delta):
	anim_player.play("Swing")
	
	touching_ground = is_on_floor()
	motion.y += GRAVITY * delta
	if touching_ground:
		motion.x = lerp(motion.x, 0, FRICTION * delta)
	else:
		motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta)
	motion = move_and_slide(motion, Vector2.UP)

func _on_CoyoteTimer_timeout():
	jump_allowed = false

func finish_swing():
	state = MOVE
