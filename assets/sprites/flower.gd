extends Node2D

@export var drops_needed : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$WaterNeeded.drops_needed = drops_needed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_complete() -> void:
	print("level complete!")
	var scene = get_tree().current_scene.name
	
	get_tree().paused = true
	$AnimatedSprite2D.play("grow")
	await get_tree().create_timer(1.0).timeout
	$CPUParticles2D.emitting = true
	await get_tree().create_timer(3.0).timeout
		
	get_tree().paused = false

	match(scene):
		'Test':
			get_tree().change_scene_to_file("res://scenes/Level0.tscn")
		'Level0':
			get_tree().change_scene_to_file("res://scenes/Level1.tscn")
		'Level1':
			get_tree().change_scene_to_file("res://scenes/Level2.tscn")
		_:
			get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
