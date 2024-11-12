extends Node2D

@export var shoot_speed = 1.0

const bullet = preload("res://Scripts/bullet.tscn")

@onready var marker2D = $Marker2D
@onready var shoot_speed_timer = $shootSpeedTime

var canShoot = true
var bulletDirection = Vector2(1,0)

func _ready() -> void:
	shoot_speed_timer.wait_time = 1.0 / shoot_speed
	
func shoot():
	if canShoot:
		canShoot = false
		shoot_speed_timer.start()
		var bulletNode = bullet.instantiate()
		bulletNode._setDirection(bulletDirection)
		get_tree().root.add_child(bulletNode)
		bulletNode.global_position = marker2D.global_position


func _on_shoot_speed_time_timeout() -> void:
	self.visible = false
	canShoot = true
	
func setup_Direction(direction):
	bulletDirection = direction
	
	if direction.x > 0:
		scale.x = 1
		rotation_degrees = 0
	elif direction.x < 0:
		scale.x = -1
		rotation_degrees = 0	
	
	
