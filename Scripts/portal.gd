extends Area2D

@onready var animation_idle = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_idle.play("idle")
