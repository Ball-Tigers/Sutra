extends Node2D

var timeUntilNextSpawn := 10 as float
var blob := preload("res://scenes/Droplet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timeUntilNextSpawn < 0:
		timeUntilNextSpawn = 10
		add_child(blob.instantiate())
		print("fart")
		return
	timeUntilNextSpawn -= delta
	print(timeUntilNextSpawn)
	print("fart 2~``")
	
