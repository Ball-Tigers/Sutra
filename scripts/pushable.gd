extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	var player := body as Player
	if player:
		if player.player_size < 3:
			print()
			#set_freeze_enabled(true)
		else:
			print()
			#set_freeze_enabled(false)


func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
