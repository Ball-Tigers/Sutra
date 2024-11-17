extends Node2D

func on_complete() -> void:
	var array = $"..".get_children()
	
	for item in array:
		var lamp := item as HeatLamp
		if lamp && lamp.id == 3:
			lamp.active = false
