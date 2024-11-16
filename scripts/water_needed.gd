extends Node2D

@export var drops_needed : int = 3
var drops_count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	var drop := body as Droplet
	var player := body as Player
	if drop:
		drops_count += drop.size
	if player:
		drops_count += player.player_size
	if drops_count >= drops_needed:
		print("Condition complete")


func _on_area_2d_body_exited(body: Node2D) -> void:
	var drop := body as Droplet
	var player := body as Player
	if drop:
		drops_count -= drop.size
	if player:
		drops_count -= player.player_size
