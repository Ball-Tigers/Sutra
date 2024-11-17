extends Node

func die() -> void:
	get_tree().paused = true
	await get_tree().create_timer(3.0).timeout
#	add particle thing here
	get_tree().reload_current_scene()
	get_tree().paused = false

func reset() -> void:
	get_tree().reload_current_scene()
