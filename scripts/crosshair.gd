extends Node

func _process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	self.transform.position = mouse_pos
