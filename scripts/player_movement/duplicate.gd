extends State

@export var fall_state: State

func enter() -> void:
	super()
	
	var mouse_pos = parent.get_local_mouse_position()
	var angle = atan2(mouse_pos.y, mouse_pos.x)
	
	if Input.is_action_just_pressed("eject"):
		# create large droplet of size 1
		# speedify droplet
		# set_velocity(cum)
		parent.player_size = 1
		
		set_velocity(parent)
		
		
		
		
	elif Input.is_action_just_pressed("shoot"):
		# create large droplet of size parent.player_size - 1
		parent.shrink()

	
	# add velocity in direction towards mouse cursor
	# change to fall_state
		
func set_velocity(node: Node2D) -> void:
	var player := node as Player
	if not player:
		return
	
	var mouse_pos = parent.get_global_mouse_position()
	var vector_pos = (mouse_pos - player.position).normalized()
	print("Mouse pos", mouse_pos)
	print("Player pos", player.position)
	var angle = atan2(vector_pos.x, vector_pos.y)

	node.velocity.x = parent.projectile_force * vector_pos.x
	node.velocity.y = parent.projectile_force * vector_pos.y
	
func process_frame(_delta: float) -> State:
	return fall_state


func get_state() -> String:
	return "Duplicate"
