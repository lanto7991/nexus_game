extends Area2D


@onready var player = $"../Player"
@onready var animated_portal = $AnimatedSprite2D

func _ready() -> void:
	animated_portal.play("idle")
