extends Node2D

@onready var sound_take = $sound_take
@onready var player = $"../../Player"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		sound_take.play()
		queue_free()
