class_name Player
extends CharacterBody2D

@onready var animations = $AnimatedSprite2D
@onready var state_machine = $StateMachine

@export var player_size = 1
@export var size_scaling = 0.5
@export var max_player_size = 5

@export var projectile_force = 300

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
		player_size += 1
		self.scale.x = player_size - size_scaling
		self.scale.y = player_size - size_scaling
	
func shrink() -> void:
	if player_size > 1:
		player_size -= 1
		self.scale.x = player_size - size_scaling
		self.scale.y = player_size - size_scaling

func total_shrink() -> void:
	player_size = 1
	self.scale.x = 1
	self.scale.y = 1

func _on_layer_2_collision_body_entered(body: Node2D) -> void:
	if body.is_in_group("Pushables"):
		body.collision_layer = 1
		body.collision_mask = 1


func _on_layer_2_collision_body_exited(body: Node2D) -> void:
	if body.is_in_group("Pushables"):
		body.collision_layer = 2
		body.collision_mask = 2
