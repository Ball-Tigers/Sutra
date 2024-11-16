class_name Droplet
extends Node2D

@export var size = 1
@export var size_scaling = 0.5
@export var max_size = 5

func _ready() -> void:
	grow(0)

func grow(drops : int) -> void:
	if size < max_size:
		size += drops
	self.scale.x = size * size_scaling
	self.scale.y = size * size_scaling
	print(size)

func shrink(drops : int) -> void:
	if size < max_size:
		size -= drops
	self.scale.x = size * size_scaling
	self.scale.y = size * size_scaling

func _on_area2D_body_entered(body: Node2D) -> void:
	#print(body)
	var player := body as Player
	if player:
		for i in size:
			player.grow()
			shrink(1)
		if size == 0:
			self.queue_free()
	var droplet := body as Droplet
	if droplet && not droplet == self:
		grow(droplet.size)
		droplet.free()
	
