extends CharacterBody2D

# Export variables for customization in the editor
@export var speed := 300.0
@export var gravity := 1000.0
@export var jump_force := 650.0

# Called when the node is ready
func _ready() -> void:
	Global.playerBody = self

# Triggered when the player touches an enemy
func _on_enemyDetector_body_entered(body: Node) -> void:
	get_tree().reload_current_scene()

# Set up movement logic in physics process
func _physics_process(delta: float) -> void:
	# Apply gravity if the player is not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	# Handle horizontal movement
	var h_direction := Input.get_axis("move_left", "move_right")
	velocity.x = h_direction * speed

	# Apply velocity for movement
	move_and_slide()

	# Call the function to handle animations
	_update_animation(h_direction)

# Function to update the animation based on movement
func _update_animation(h_direction: float) -> void:
	var is_jumping := velocity.y != 0
	var is_moving := h_direction != 0

	if is_jumping:
		$AnimatedSprite2D.play("jump")
	elif is_moving:
		if h_direction > 0:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("move")
		elif h_direction < 0:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("move")
	else:
		$AnimatedSprite2D.play("idle")

# Process input for shooting or other actions
func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot"):
		$AnimatedSprite2D.play("shoot_guns")
"""
extends CharacterBody2D

#export de variables para poder usarlas aparte 
@export var speed = 300
@export var gravity = 100
@export var jump_force = 650	
	

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
		

	
	
	move_and_slide()

"""
