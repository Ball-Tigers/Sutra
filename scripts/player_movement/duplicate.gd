extends State

@export var fall_state: State

func enter() -> void:
	super()
	
	var mouse_pos = parent.get_local_mouse_position()
	var angle = atan2(mouse_pos.y, mouse_pos.x)
	
	print(mouse_pos)
	
	if Input.is_action_just_released("eject"):
		# create large droplet of size parent.player_size - 1
		parent.player_size = 1
		set_velocity(parent)
		
		
	elif Input.is_action_just_released("shoot"):
		parent.shrink()
		# create large droplet of size 1
		# speedify droplet
		# set_velocity(cum)
	
	# add velocity in direction towards mouse cursor
	# change to fall_state
		
func set_velocity(node: Node2D) -> void:
	var mouse_pos = parent.get_local_mouse_position()
	var angle = atan2(mouse_pos.y, mouse_pos.x)

	node.velocity.x = parent.projectile_force * mouse_pos.x * cos(angle)
	node.velocity.y = parent.projectile_force * mouse_pos.y * sin(angle)
	
func process_frame(_delta: float) -> State:
	return fall_state


func get_state() -> String:
	return "Duplicate"
