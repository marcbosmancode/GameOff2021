extends Camera2D

onready var topLeft = $MovementBox/TopLeft
onready var bottomRight = $MovementBox/BottomRight

func _ready():
	limit_top = topLeft.position.y
	limit_left = topLeft.position.x
	limit_right = bottomRight.position.x
	limit_bottom = bottomRight.position.y
