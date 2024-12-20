extends CharacterBody2D

var win_size: Vector2
const SPEED: int = 400
var dir: Vector2
const MAX_Y_VECTOR: float = 0.6
var ball_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	win_size = get_viewport_rect().size

func new_ball():
	position.x = win_size.x / 2
	position.y = randi_range(200, win_size.y - 200)
	dir = random_direction()
	ball_pos = position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	ball_pos = position.y
	var collision = move_and_collide(dir * SPEED * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		# задевает ракетку
		if collider == $"../LeftRocket" or collider == $"../RightRocket":
			dir = new_direction(collider)
		# задевает стену
		else:
			dir = dir.bounce(collision.get_normal())

func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()

func new_direction(collider):
	var dist = position.y - collider.position.y # расстояние от мяча до центра, то есть в какую часть ракетки попал мяч, в верхнюю - потом откочет вверх
	var new_dir := Vector2()

	if dir.x > 0: # правая рокетка
		new_dir.x = -1
	else: # левая рокетка
		new_dir.x = 1
	new_dir.y = dist / (collider.rocket_height / 2) * MAX_Y_VECTOR
	return new_dir.normalized()
