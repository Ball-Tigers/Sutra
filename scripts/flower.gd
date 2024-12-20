extends Node2D

@export var drops_needed : int
@onready var victory: AudioStreamPlayer2D = $victory


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$WaterNeeded.drops_needed = drops_needed

func on_complete() -> void:
	victory.play()
	var scene = get_tree().current_scene.name
	
	get_tree().paused = true
	$AnimatedSprite2D.play("grow")
	
	await get_tree().create_timer(1.0).timeout
	$CPUParticles2D.emitting = true
	await get_tree().create_timer(3.0).timeout
	get_tree().paused = false
	Game.level_end(scene)
