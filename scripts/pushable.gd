extends RigidBody2D

var locked = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var collisions = get_colliding_bodies()
	for item in collisions:
		if item.has_method("move_and_slide"):
			var player = item as CharacterBody2D
			apply_central_impulse(player.velocity)
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body.size == null:
		if body.size < 3:
			locked = true
		else:
			locked = false
