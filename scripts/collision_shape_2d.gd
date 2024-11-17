extends CollisionShape2D

func _on_area_2d_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	var player := body as Player
	if not player:
		return
	get_tree().change_scene_to_packed(load("res://scenes/Level0.tscn"))
