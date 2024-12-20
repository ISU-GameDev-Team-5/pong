extends CharacterBody2D

var screen_height: int
var rocket_height: int
const ROCKET_SPEED: int = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_height = get_viewport_rect().size.y
	rocket_height = $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("left_up"):
		position.y -= ROCKET_SPEED * delta
	if Input.is_action_pressed("left_down"):
		position.y += ROCKET_SPEED * delta
	
	position.y = clamp(position.y, rocket_height / 2, screen_height - rocket_height / 2)
