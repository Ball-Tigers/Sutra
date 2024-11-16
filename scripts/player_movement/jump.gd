extends State

@export var fall_state: State
@export var duplicate_state: State

func enter() -> void:
	super()
	parent.velocity.y = -jump_speed
	
func process_frame(_delta: float) -> State:
	if parent.velocity.y > 0.0:
		return fall_state
	return null
	
func process_input(_event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if Input.is_action_pressed("right"):
		parent.velocity.x = move_toward(parent.velocity.x, walk_speed, walk_acc)
		flip_right(parent)
	elif Input.is_action_pressed("left"):
		parent.velocity.x = move_toward(parent.velocity.x, -walk_speed, walk_acc)
		flip_left(parent)
	if Input.is_action_just_released('jump'):
		parent.velocity.y *= 0.5
	
	parent.move_and_slide()
	return null

func get_state() -> String:
	return "Jump"
