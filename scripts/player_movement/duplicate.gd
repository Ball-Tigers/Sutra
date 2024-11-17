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
		
#		create new blob
		var blob = newDroplet.instantiate()
		blob.set_size(parent.player_size - 1)
		blob.position = parent.position
		add_sibling(blob)
		
#		set parent velocity
		set_velocity(parent)
		parent.total_shrink()
		$"../../EjectParticle".emitting = true
		
#		
			
	elif Input.is_action_just_pressed("shoot"):
#		Set character to size - 1, shoot blob of size 1
		print(parent.player_size)
		parent.shrink()
		
		var blob = newDroplet.instantiate()
		blob.set_size(1)
		blob.position = parent.position
		set_velocity(blob)
		add_sibling(blob)
		
func set_velocity(node: Node2D) -> void:
	var player := parent as Player
	if not player:
		return
	
	var mouse_pos = parent.get_global_mouse_position()
	var vector_pos = (mouse_pos - player.position).normalized()
	var projectile_force = parent.player_size * parent.default_projectile_force
	

	var drop := node as Droplet
	if drop:
		drop.position += vector_pos * 10 * parent.player_size
		drop.apply_impulse(vector_pos * projectile_force)
		return
	
	print("Mouse pos", mouse_pos)
	print("Player pos", player.position)
	var angle = atan2(vector_pos.x, vector_pos.y)
	node.velocity.x = projectile_force * vector_pos.x
	node.velocity.y = projectile_force * vector_pos.y
	
	
func process_frame(_delta: float) -> State:
	return fall_state


func get_state() -> String:
	return "Duplicate"
