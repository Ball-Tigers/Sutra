class_name Droplet
extends RigidBody2D

@export var droplet_size = 1
@export var size_scaling = 0.5
@export var max_player_size = 5

var timer : float = 0.1

func _ready() -> void:
	grow(0)
	

func _process(delta: float) -> void:
	if timer > 0:
		timer -= delta
		
func set_size(size : int) -> void:
	droplet_size = size
	self.scale.x = size * size_scaling
	self.scale.y = size * size_scaling

func grow(drops : int) -> void:
	if droplet_size < max_player_size:
		droplet_size += drops
		self.scale.x = droplet_size * size_scaling
		self.scale.y = droplet_size * size_scaling

func shrink(drops : int) -> void:
	if droplet_size < max_player_size:
		droplet_size -= drops
		self.scale.x = droplet_size * size_scaling
		self.scale.y = droplet_size * size_scaling


func _on_area2D_body_entered(body: Node2D) -> void:
	if timer > 0:
		return
	var player := body as Player
	if player:
		for i in droplet_size:
			player.grow()
			shrink(1)
		if droplet_size == 0:
			self.queue_free()
	var droplet := body as Droplet
	if droplet && not droplet == self:
		grow(droplet.droplet_size)
		droplet.free()
	
