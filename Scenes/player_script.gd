extends CharacterBody2D

@onready var main = get_tree().get_root().get_node("Player")

var bullet = preload("res://Scripts/bullet.tscn")

@export var speed = 300
@export var jump_force = -600
@export var maxHealth = 30

@onready var gun = $Gun
@export var velocity_bullet: float = 600.0

@export var shootSpeed = 1.0
@onready var marker = $position/Marker2D
@onready var timer = $shootSpeedTimer
@onready var life_bar = $Camera2D/ProgressBarLife

var double_jump = false
var canShoot = true

@onready var sfx_des_arma = $sfx_des_arma
@onready var sfx_jump = $sfx_jump

@onready var animation_sprite = $AnimatedSprite2D
@onready var currentHealth: int = maxHealth

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2.ZERO

func _ready():
	Global.playerBody = self
	#$AnimatedSprite2D.play("idle")
	gun.visible = false
	
func _on_enemyDetector_body_entered(body: Node) -> void:
	get_tree().reload_current_scene()

	
# Función para manejar la física del personaje
func _physics_process(delta: float) -> void:
	
		
	if Input.is_action_just_pressed("shoot"):
		gun.shoot()		
	
	#var movement_character = Input.get_axis("move_left", "move_right")
			
	direction.x = Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)	

		
	if direction != Vector2.ZERO:
		gun.setup_Direction(direction)	
		
	if not is_on_floor():
		velocity.y += gravity * delta

	if direction.x != 0:
		velocity.x = direction.x * speed
		if is_on_floor():
			$AnimatedSprite2D.play("move")
		else:
			$AnimatedSprite2D.play("saltar")
		$AnimatedSprite2D.flip_h = direction.x < 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if is_on_floor():
			$AnimatedSprite2D.play("idle")
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_force
		sfx_jump.play()

	elif not is_on_floor():
		$AnimatedSprite2D.play("saltar")
			
	#instancia el doble salto 
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_force
			double_jump = true
		else:
			if double_jump:
				velocity.y = jump_force
				double_jump = false

	move_and_slide()


			# Aplicar gravedad si no está en el suelo
	
#
	#
		#
		
	
	#
	#
#
	#
	#
		#
		
 
