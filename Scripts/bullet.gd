extends CharacterBody2D

@onready var timer = $Timer

@export var speed: int

var vel = Vector2(1, 0)

func _ready() -> void:
	speed = 0
	
func _physics_process(_delta):
	#move bullet
	self.visible = true
	speed = 100
	var collision_info = move_and_collide(vel.normalized() * _delta * speed)
	
	if timer.contador == 1:
		self.queue_free()
		
	
