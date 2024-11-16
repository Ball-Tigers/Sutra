extends State

@export var fall_state: State

@onready var newDroplet = preload("res://scenes/Droplet.tscn")

func enter() -> void:
	super()
	
#	guard clause
	if parent.player_size <= 1 :
		return

	if Input.is_action_just_pressed("eject"):
#		Set character to 1, leave blob of size - 1
		
#		set parent velocity
		set_velocity(parent)
		
#		create new blob
		var blob = newDroplet.instantiate()
		blob.set_size(parent.player_size - 1)
		blob.position = parent.position
		add_sibling(blob)
		parent.total_shrink()
			
	elif Input.is_action_just_pressed("shoot"):
#		Set character to size - 1, shoot blob of size 1
		print(parent.player_size)
		parent.shrink()

	
	# add velocity in direction towards mouse cursor
	# change to fall_state
		
func set_velocity(node: Node2D) -> void:
	var player := node as Player
	if not player:
		return
	
	var mouse_pos = parent.get_global_mouse_position()
	var vector_pos = (mouse_pos - player.position).normalized()
	var projectile_force = parent.player_size * parent.default_projectile_force

	
	print("Mouse pos", mouse_pos)
	print("Player pos", player.position)
	var angle = atan2(vector_pos.x, vector_pos.y)
	node.velocity.x = projectile_force * vector_pos.x
	node.velocity.y = projectile_force * vector_pos.y
	
func process_frame(_delta: float) -> State:
	return fall_state


func get_state() -> String:
	return "Duplicate"
