class_name Player
extends CharacterBody2D

@onready var animations = $AnimatedSprite2D
@onready var state_machine = $StateMachine

@export var player_size = 1
@export var size_scaling = 0.5
@export var max_player_size = 5

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func grow() -> void:
	if player_size < max_player_size:
		player_size += size_scaling
	self.scale.x = player_size
	self.scale.y = player_size
	
func shrink() -> void:
	if player_size > size_scaling:
		player_size -= size_scaling
	self.scale.x = player_size
	self.scale.y = player_size
