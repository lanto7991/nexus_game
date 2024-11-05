extends CharacterBody2D



# Exportar variables para usarlas en el editor
@export var speed = 300
@export var jump_force = -500
@export var maxHealth = 30

const bulletLoad = preload("res://Scripts/bullet.tscn")

@export var bullet_scene: PackedScene
@export var bullet_speed: float = 600.0



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
	
	var direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

	var directionR = Input.is_action_just_pressed("move_right")
	var directionL = Input.is_action_just_pressed("move_left")
	
	if Input.is_action_just_pressed("shoot"):
		var bulletNode = bulletLoad.instantiate()	
		var direction_bullet = $Shoot
		
		if directionR:
			bulletNode.global_position = direction_bullet.global_position
			bulletNode.velocity.x = bullet_speed
			print (direction)
		else:
			bulletNode.global_position = direction_bullet.global_position  #altura de la bala (izquierda)	
			bulletNode.velocity.x = -bullet_speed
			print (direction)
				
		$AnimatedSprite2D.play("shoot_guns")			
		sfx_des_arma.play()	
					
		get_parent().add_child(bulletNode)	
		
	move_and_slide()
	# Aplicar gravedad si no está en el suelo
	if not is_on_floor():
		velocity.y += gravity * delta

	if direction != 0:
		velocity.x = direction * speed
		#print(direction)
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
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_force
			double_jump = true
		else:
			if double_jump:
				velocity.y = jump_force
				double_jump = false
		
#func shoot():		
		#var bulletNode = bulletLoad.instantiate()	
		#var direction_bullet = Vector2(0, -1) 
		#bulletNode.position = position + Vector2(100, -60) #altura de la bala
		#bulletNode.velocity.x = direction_bullet.x * bullet_speed * -1
				#
		#$AnimatedSprite2D.play("shoot_guns")			
		#sfx_des_arma.play()	
					#
		#get_parent().add_child(bulletNode)	

	
 
