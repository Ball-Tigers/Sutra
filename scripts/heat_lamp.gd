class_name HeatLamp
extends Node2D

@export var active : bool = true
@export var id : int
@onready var sizzle: AudioStreamPlayer2D = $sizzle

func _process(_delta: float) -> void:
	if not active:
		$CPUParticles2D.emitting = false
		$CPUParticles2D2.emitting = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	var player := body as Player
	if not player:
		return
	
	if active:
		Game.die()
		sizzle.play()
		
