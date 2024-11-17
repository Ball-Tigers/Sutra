class_name State
extends Node

@export var animation_name: String
# Speeds
@export var default_walk_speed = 180.0
var walk_speed = 150.0
@export var jump_speed = 350.0

# Accelerations
@export var walk_acc = 10.0
@export var walk_dec = 0.2

# Player sizing
@export var player_size = 1
const max_player_size = 5

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

## Hold a reference to the parent so that it can be controlled by the state
var parent: Player

func enter() -> void:
	parent.animations.play(animation_name)

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
	
