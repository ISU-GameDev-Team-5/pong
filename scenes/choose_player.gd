extends CanvasLayer

func _on_one_player_pressed():
	GameData.is_bot = true
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")

func _on_two_player_pressed():
	GameData.is_bot = false
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
