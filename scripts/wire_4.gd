extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_complete() -> void:
	var array = $"..".get_children()
	
	for item in array:
		var lamp := item as HeatLamp
		if lamp && lamp.id == 1:
			lamp.active = false
