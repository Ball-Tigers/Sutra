extends State

@export var fall_state: State
@export var duplicate_state: State
@onready var jump: AudioStreamPlayer2D = $"../../jump"



func enter() -> void:
	super()
	jump.play()
	parent.velocity.y = -jump_speed
	
func process_frame(_delta: float) -> State:
	if parent.velocity.y > 0.0:
		return fall_state
	return null
	
func process_input(_event: InputEvent) -> State:
	if parent.player_size > 1 and (Input.is_action_just_pressed("eject") or Input.is_action_just_pressed("shoot")):
		return duplicate_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if Input.is_action_pressed("right"):
		var temp = move_toward(parent.velocity.x, walk_speed, walk_acc)
		parent.velocity.x = max(parent.velocity.x, temp)
		parent.animations.flip_h = false
		

	elif Input.is_action_pressed("left"):
		parent.velocity.x = min(parent.velocity.x, move_toward(parent.velocity.x, -walk_speed, walk_acc))
		parent.animations.flip_h = true

	if Input.is_action_just_released('jump'):
		parent.velocity.y *= 0.5
		
		
		
		
	
	parent.move_and_slide()
	return null

func get_state() -> String:
	return "Jump"
