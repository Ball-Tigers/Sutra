extends State

@export var jump_state: State
@export var fall_state: State
@export var walk_state: State
@export var duplicate_state: State

func enter() -> void:
	super()
	parent.velocity.x = 0

func process_frame(_delta: float) -> State:
	if !parent.is_on_floor():
		return fall_state
	return null

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed('jump'):
		return jump_state
	elif Input.is_action_just_pressed('left') or Input.is_action_just_pressed('right'):
		return walk_state
	elif parent.player_size > 1 and (Input.is_action_just_pressed("eject") or Input.is_action_just_pressed("shoot")):
		return duplicate_state
	return null
	
func get_state() -> String:
	return "Idle"
