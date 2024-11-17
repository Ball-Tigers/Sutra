extends Node2D

var timeUntilNextSpawn := 3 as float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timeUntilNextSpawn < 3:
		timeUntilNextSpawn -= delta
		return
	timeUntilNextSpawn = 3
	add_child($"res://scenes/Droplet.tscn")
