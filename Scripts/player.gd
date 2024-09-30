extends CharacterBody2D

#export de variables para poder usarlas aparte 
@export var speed = 300
@export var gravity = 100
@export var jump_force = 650	

@onready var MenuPausa = $pause_menu

@onready var animation = $AnimationPlayer

@onready var enemy_player = $enemy_level1

@onready var coins = $coins



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
		
		
	#seteo variable de Input para mover el personaje en R y L
	var h_direction = Input.get_axis("move_left", "move_right")
	
	#aplico velocidad a X e Y para que pueda moverse
	velocity.x = speed * h_direction
	
func _process(delta: float) -> void:
	var right = Input.is_action_pressed("move_right")
	var left = Input.is_action_pressed("move_left")
	
	var enemy_bar = enemy_player.enemy_pb
	
	if right:
		animation.play("move")
	elif left:
		animation.play("move")
	
	move_and_slide()
	
	
