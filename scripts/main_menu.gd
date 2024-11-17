extends Control

@onready var play_button: Button = $Button



func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_packed(load("res://scenes/Level0.tscn"))


func _on_level_2_button_pressed() -> void:
	get_tree().change_scene_to_packed(load("res://scenes/Level1.tscn"))


func _on_level_3_button_pressed() -> void:
	get_tree().change_scene_to_packed(load("res://scenes/Level2.tscn"))
