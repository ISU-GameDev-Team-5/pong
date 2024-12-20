extends Node

var first_player_score := 0
var second_player_score := 0
const WIN_SCORE: int = 3

var is_bot = GameData.is_bot
var ball_pos

func _ready():
	new_game()

func new_game():
	first_player_score = 0
	second_player_score = 0
	$ball.new_ball()
	ball_pos = $ball.ball_pos
	
func _process(delta):
	ball_pos = $ball.ball_pos

func _on_goal_left_body_entered(body):
	first_player_score += 1
	$Score/Left.text = str(first_player_score)
	$ball.new_ball()
	check_game_over()

func _on_goal_right_body_entered(body):
	second_player_score += 1
	$Score/Right.text = str(second_player_score)
	$ball.new_ball()
	check_game_over()

func check_game_over():
	if first_player_score >= WIN_SCORE:
		GameData.winner = 2
		get_tree().change_scene_to_file("res://scenes/win_scene.tscn")
	elif second_player_score >= WIN_SCORE:
		GameData.winner = 1
		get_tree().change_scene_to_file("res://scenes/win_scene.tscn")

func get_ball_pos():
	return $ball.ball_pos  # текущая позиция мяча
