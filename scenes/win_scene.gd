extends CanvasLayer

func _ready():
	var player_label = $Player
	if GameData.winner == 1:
		player_label.text = "Выиграл игрок слева"
	elif GameData.winner == 2:
		player_label.text = "Выиграл игрок справа"


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
