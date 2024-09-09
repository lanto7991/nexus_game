extends CharacterBody2D

#signal healthChanged

#export de variables para poder usarlas aparte 
@export var speed = 300
@export var gravity = 100
@export var jump_force = 650	

@export var maxHealth = 30
@onready var currentHealth: int = maxHealth

var isHurt: bool = false

func _ready():
	Global.playerBody = self
	

func _on_enemyDetector_body_entered(body: Node) -> void:
	get_tree().reload_current_scene()

#funcion para setear movimiento del personaje
func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta	
		
	#seteo variable de salto
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		
	#var direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

	#seteo variable de Input para mover el personaje en R y L
	var h_direction = Input.get_axis("move_left", "move_right")
	
		#aplico velocidad a X e Y para que pueda moverse
	velocity.x = speed * h_direction
	
func _process(delta: float) -> void:
	var right = Input.is_action_pressed("move_right")
	var left = Input.is_action_pressed("move_left")
	var space = Input.is_action_pressed("jump")
	var shoot_gun = Input.is_action_pressed("shoot")
	
	
	#seteo variables de animacion
	if right and velocity.x != 0 and !space:
		$AnimatedSprite2D.play("move")
	elif left and velocity.x != 0 and !space:
		$AnimatedSprite2D.play("move_L")
		$AnimatedSprite2D.stop()
	elif space and velocity.x != 0:
		$AnimatedSprite2D.play("saltar")
	elif shoot_gun and velocity.x != 0:
		$AnimatedSprite2D.play("shoot_guns")
	elif velocity.x == 0:
		$AnimatedSprite2D.play("idle")
		

#func hurtByEnemy(area):
#	currentHealth -= 10
#	if currentHealth < 0:
#		currentHealth = maxHealth
		
#	isHurt = true
#	healthChanged.emit()
	
	
	move_and_slide()
	
