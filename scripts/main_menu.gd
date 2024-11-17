extends Control

func _on_level_1_button_pressed() -> void:
	Game.currLevel = preload("res://scenes/Level0.tscn")
	get_tree().change_scene_to_packed(Game.currLevel)

func _on_level_2_button_pressed() -> void:
	Game.currLevel = preload("res://scenes/Level1.tscn")
	get_tree().change_scene_to_packed(Game.currLevel)

func _on_level_3_button_pressed() -> void:
	Game.currLevel = preload("res://scenes/Level2.tscn")
	get_tree().change_scene_to_packed(Game.currLevel)
