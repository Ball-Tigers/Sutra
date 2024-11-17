extends Node2D

func on_complete() -> void:
	var array = $"..".get_children()
	#electric.play()
	for item in array:
		var lamp := item as HeatLamp
		if lamp && (lamp.id == 0 || lamp.id == 1 || lamp.id == 2):
			lamp.active = false
			
