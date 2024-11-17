extends Node

func die() -> void:
	get_tree().paused = true
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()
	get_tree().paused = false

func reset() -> void:
	get_tree().reload_current_scene()
