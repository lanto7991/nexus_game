extends CharacterBody2D

# Exportar variables para usarlas en el editor
@export var speed = 300
@export var jump_force = -500
@export var maxHealth = 30
const bulletLoad = preload("res://Scripts/bullet.tscn")


@onready var sfx_des_arma = $sfx_des_arma
@onready var sfx_jump = $sfx_jump

#@onready var Bala = load("res://escenas/bala.tscn")
@onready var currentHealth: int = maxHealth

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var isHurt: bool = false

func _ready():
	Global.playerBody = self
	$AnimatedSprite2D.play("idle")
	
func _on_enemyDetector_body_entered(body: Node) -> void:
	get_tree().reload_current_scene()

# Función para manejar la física del personaje
func _physics_process(delta: float) -> void:
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
		
	
	#instancia el doble salto 
	#if not is_on_floor() and Input.is_action_just_pressed("ui_accept"):
	#	velocity.y = jump2  #creando la constante o varia
	
	#animated shoot

	if Input.is_action_pressed("shoot"):
		$AnimatedSprite2D.play("shoot_guns")
		sfx_des_arma.play()
		shoot()
	
func shoot():
	var bullet = bulletLoad.instantiate()	
	get_parent().add_child(bullet)
	bullet.position = $position/Marker2D.global_position
	
	
	
	#instance.dir = rotation
	#instance.spanwPos = global_position
	#instance.spawnRot = rotation
	#get_tree().root.add_child(instance)
	
	
	
	#var mouse_position = get_global_mouse_position()
	#var mouse_direction = (mouse_position - global_position).normalized()
	
	#var bullet_speed = 500
	
	#instance.velocity = mouse_direction * bullet_speed
	
	
