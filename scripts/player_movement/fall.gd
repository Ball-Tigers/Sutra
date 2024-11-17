extends State

@export var idle_state: State
@export var walk_state: State
@export var duplicate_state: State

func enter() -> void:
	super()

func process_frame(_delta: float) -> State:
	if parent.is_on_floor():
		if parent.velocity.x != 0:
			return walk_state
		return idle_state
	return null

func process_input(_event: InputEvent) -> State:
	if parent.player_size > 1 and (Input.is_action_just_pressed("eject") or Input.is_action_just_pressed("shoot")):
		return duplicate_state
	return null;
	
func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if Input.is_action_pressed("right"):
		parent.velocity.x = max(parent.velocity.x, min(parent.velocity.x + walk_acc, walk_speed))
		parent.animations.flip_h = false
	elif Input.is_action_pressed("left"):
		parent.velocity.x = min(parent.velocity.x, max(parent.velocity.x - walk_acc, -walk_speed))
		parent.animations.flip_h = true
		
	parent.move_and_slide()
	return null

func get_state() -> String:
	return "Fall"
