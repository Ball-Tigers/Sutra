extends Control

@onready var play_button: Button = $Button



func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(load("res://scenes/Level0.tscn"))
