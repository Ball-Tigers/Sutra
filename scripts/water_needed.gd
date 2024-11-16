extends Node2D

@export var drops_needed : int = 3
var drops_count = 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	var drop := body as Droplet
	var player := body as Player
	if drop:
		drops_count += drop.droplet_size
		pass
	if player:
		drops_count += player.player_size
	if drops_count >= drops_needed:
		print("Condition complete")
		get_parent().on_complete()


func _on_area_2d_body_exited(body: Node2D) -> void:
	var drop := body as Droplet
	var player := body as Player
	if drop:
		drops_count -= drop.droplet_size
	if player:
		drops_count -= player.player_size
