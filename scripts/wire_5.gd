extends Node2D
@onready var electric: AudioStreamPlayer2D = $electric

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_complete() -> void:
	var array = $"..".get_children()
	#electric.play()
	for item in array:
		var lamp := item as HeatLamp
		if lamp && lamp.id == 2:
			lamp.active = false
