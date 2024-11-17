class_name Player
extends CharacterBody2D

@onready var animations = $AnimatedSprite2D
@onready var state_machine = $StateMachine

@export var player_size = 1
@export var size_scaling = 0.4
@export var max_player_size = 5

@export var default_projectile_force = 150

@onready var water_droplet: AudioStreamPlayer2D = $WaterDroplet

func _ready() -> void:
	state_machine.init(self)
	total_shrink()

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func grow() -> void:
	if player_size < max_player_size:
		player_size += 1
		self.scale.x = player_size * size_scaling
		self.scale.y = player_size * size_scaling
		$StateMachine/Walk.walk_speed = $StateMachine/Walk.default_walk_speed - 20 * player_size
		$StateMachine/Idle.walk_speed = $StateMachine/Idle.default_walk_speed - 20 * player_size
		$StateMachine/Jump.walk_speed = $StateMachine/Jump.default_walk_speed - 20 * player_size
		$StateMachine/Fall.walk_speed = $StateMachine/Fall.default_walk_speed - 20 * player_size
		$StateMachine/Duplicate.walk_speed = $StateMachine/Duplicate.default_walk_speed - 20 * player_size
		$StateMachine/Walk.jump_speed = 350 - 20 * player_size
		$StateMachine/Idle.jump_speed = 350 - 20 * player_size
		$StateMachine/Jump.jump_speed = 350 - 20 * player_size
		$StateMachine/Fall.jump_speed = 350 - 20 * player_size
		$StateMachine/Duplicate.jump_speed = 350 - 20 * player_size
		self.scale.x = player_size - size_scaling
		self.scale.y = player_size - size_scaling
		water_droplet.play()
		
	
func shrink() -> void:
	if player_size > 1:
		player_size -= 1
		self.scale.x = player_size * size_scaling
		self.scale.y = player_size * size_scaling
		$StateMachine/Walk.walk_speed = $StateMachine/Walk.default_walk_speed - 20 * player_size
		$StateMachine/Idle.walk_speed = $StateMachine/Idle.default_walk_speed - 20 * player_size
		$StateMachine/Jump.walk_speed = $StateMachine/Jump.default_walk_speed - 20 * player_size
		$StateMachine/Fall.walk_speed = $StateMachine/Fall.default_walk_speed - 20 * player_size
		$StateMachine/Duplicate.walk_speed = $StateMachine/Duplicate.default_walk_speed - 20 * player_size

func total_shrink() -> void:
	player_size = 1
	self.scale.x = player_size * size_scaling
	self.scale.y = player_size * size_scaling

func _on_layer_2_collision_body_entered(body: Node2D) -> void:
	if body.is_in_group("Pushables"):
		body.collision_layer = 1
		body.collision_mask = 1

func die() -> void:
	$DeathParticle.emitting = true

func _on_layer_2_collision_body_exited(body: Node2D) -> void:
	if body.is_in_group("Pushables"):
		body.collision_layer = 2
		body.collision_mask = 2
