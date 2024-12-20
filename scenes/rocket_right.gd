extends CharacterBody2D

var screen_height: int
var rocket_height: int
const ROCKET_SPEED: int = 400
const ROCKET_BOT_SPEED: int = 50
var ball_pos
var dist : int
var move_by : int

var is_bot = GameData.is_bot 

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_height = get_viewport_rect().size.y
	rocket_height = $ColorRect.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ball_pos = get_parent().get_ball_pos()
	#print(ball_pos)
	#print(position.y)
	if is_bot:
		if ball_pos < position.y:
			position.y -= ROCKET_BOT_SPEED * delta
		elif ball_pos > position.y:
			position.y += ROCKET_BOT_SPEED * delta
	else:
		if Input.is_action_pressed("right_up"):
			position.y -= ROCKET_SPEED * delta
		if Input.is_action_pressed("right_down"):
			position.y += ROCKET_SPEED * delta
	
	
	position.y = clamp(position.y, rocket_height / 2, screen_height - rocket_height / 2)
