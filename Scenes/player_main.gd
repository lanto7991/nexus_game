extends CharacterBody2D

@export var speed = 300
@export var jump_force = -500
@export var maxHealth = 30


@export var shootSpeed = 1.0
@onready var marker = $position/Marker2D
@onready var timer = $shootSpeedTimer
@onready var life_bar = $Camera2D/ProgressBarLife

var double_jump = false


var canShoot = true

var bulletDirection = Vector2(1,0)

@onready var dir = $"."


@onready var sfx_des_arma = $sfx_des_arma
@onready var sfx_jump = $sfx_jump

#@onready var Bala = load("res://escenas/bala.tscn")
@onready var currentHealth: int = maxHealth

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var isHurt: bool = false

var input_jump = Input.is_action_just_pressed("jump")

func _on_enemyDetector_body_entered(body: Node) -> void:
	get_tree().reload_current_scene()

func _ready() -> void:
	Global.playerBody = self
	$AnimatedSprite2D.play("idle")
	timer.wait_time = 1.0 / shootSpeed
	







	move_and_slide()
