extends CharacterBody2D

# Exportar variables para usarlas en el editor
@export var speed = 300
@export var jump_force = -500
@export var maxHealth = 30

const bulletLoad = preload("res://Scripts/bullet.tscn")

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

func _ready():
	Global.playerBody = self
	$AnimatedSprite2D.play("idle")
	timer.wait_time = 1.0 / shootSpeed
	
	
func _on_enemyDetector_body_entered(body: Node) -> void:
	get_tree().reload_current_scene()

# Función para manejar la física del personaje
func _physics_process(delta: float) -> void:
	shoot()
		
	move_and_slide()
	# Aplicar gravedad si no está en el suelo
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

	if direction != 0:
		velocity.x = direction * speed
		# Si está en el suelo, reproducir animación de movimiento
		if is_on_floor():
			$AnimatedSprite2D.play("move")
		# Si no está en el suelo, reproducir la animación de salto
		else:
			$AnimatedSprite2D.play("saltar")
		$AnimatedSprite2D.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		# Solo reproducir la animación de idle si está en el suelo y no hay dirección de movimiento
		if is_on_floor():
			$AnimatedSprite2D.play("idle")
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_force
		sfx_jump.play()

	elif not is_on_floor():
		$AnimatedSprite2D.play("saltar")
		
	#if is_on_floor() and life_bar.value:
		#var player = self
		#$AnimatedSprite2D.play("no_damage")
		#player.disable_mode = false
		
	
	#instancia el doble salto 
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_force
			double_jump = true
		else:
			if double_jump:
				velocity.y = jump_force
				double_jump = false
		
func shoot():			
		if Input.is_action_just_pressed("shoot"):
			
			$AnimatedSprite2D.play("shoot_guns")
			sfx_des_arma.play()
			var bulletNode = bulletLoad.instantiate()		
			bulletNode.global_position = $position/Marker2D.global_position			
			get_tree().root.add_child(bulletNode)		
			

	
func setup_direction(direction):
	bulletDirection = direction	
	if direction.x > 0:
		scale.x = 1
		rotation_degrees = 0
	elif direction.x < 0:
		scale.x = -1
		rotation_degrees = 0	
	elif direction.y < 0:
		scale.x = 1
		rotation_degrees = -90	
	elif direction.y > 0:
		scale.x = 1
		rotation_degrees = 90		
		
		
	 
