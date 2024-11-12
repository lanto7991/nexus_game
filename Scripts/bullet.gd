extends Area2D

@export var speed = 100

@export var damage = 15

@onready var enemy_lvl1

var direction: Vector2

func _ready() -> void:
	await get_tree().create_timer(3).timeout
	queue_free()

func _setDirection(bulletDirection):
	direction = bulletDirection
	rotation_degrees = rad_to_deg(global_position.angle_to_point(global_position+position))
	
func _physics_process(delta: float) -> void:
	global_position +=	direction * speed * delta	
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.queue_free()
		queue_free()















#@export var speed = 100
#
#var direccion = Vector2(1,0) 
#var velocidad = 600
#var dir: float
#var spawnPoint: Vector2
#var spawnRot: float
#
#func _ready() -> void:
	#global_position = spawnPoint
	#global_rotation = spawnRot
	#
#func _physics_process(delta: float) -> void:
	## Mover la bala en la dirección especificada
	#position += direccion * velocidad * delta
	#
	#velocity = Vector2(speed, 0).rotated(dir)
	#move_and_slide()
#




#extends CharacterBody2D
#
#@onready var timer = $Timer
#
#@export var speed: int
#
#
#@export var direction: int = 0 
#
#var vel = Vector2(1, direction)
#
#
#func _ready() -> void:
	#pass
	#
#func _physics_process(_delta):
	##move bullet
	#speed = 100
	#var collision_info = move_and_collide(vel * speed * _delta)
	#
	#
	#if timer.contador == 1:
		#self.queue_free()
		#
	#
