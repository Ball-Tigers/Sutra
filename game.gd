extends Node

@export var currLevel : PackedScene
func die() -> void:
	get_tree().paused = true
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()
	get_tree().paused = false

func reset() -> void:
	get_tree().reload_current_scene()
	
func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("Reset")):
		get_tree().change_scene_to_packed(currLevel)
	elif(Input.is_action_just_pressed("Menu")):
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
		
func level_end(scene):
	
	
	match(scene):
		'Test':
			get_tree().change_scene_to_file("res://scenes/Level0.tscn")
			currLevel = preload("res://scenes/Level0.tscn")
		'Level0':
			get_tree().change_scene_to_file("res://scenes/Level1.tscn")
			currLevel = preload("res://scenes/Level1.tscn")
		'Level1':
			get_tree().change_scene_to_file("res://scenes/Level2.tscn")
			currLevel = preload("res://scenes/Level2.tscn")
		_:
			get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
			currLevel = preload("res://scenes/MainMenu.tscn")
