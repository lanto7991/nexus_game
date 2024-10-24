extends CharacterBody2D

@onready var progress_bar = $"../Player/Camera2D/ProgressBarLife"

@onready var resetLost = $"../CanvasLayer/RESET_AGAIN_LOST"

@onready var enemy_pb = $hitbox/enemy_pb

@onready var text_points = $"../Player/Camera2D/Status/Label"

@onready var bullet = $"../Player/Bullet"

@onready var timer = $"../Timer"

@onready var jugador_p = $"../Player"

@onready var score = $Score

@onready var area_respanw = $"../AREA_RESPAWN"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


var points: int = 0

const speed = 50

var is_enemy_chase: bool = true

var healt = 80
var healt_max = 80
var healt_min = 0
 
var dead: bool = false

var taking_damage: bool = false
var damage_to_deal = 20
var is_dealing_damage: bool = false

var dir: Vector2
const gravity = 800

var knockback_force = -50
var is_roaming: bool = true

var player: CharacterBody2D
var player_in_area = false



func _physics_process(delta: float) -> void:
	pass
	
func move(delta):
	if !dead:
		if !is_enemy_chase:
			velocity += dir * speed * delta
			
		elif is_enemy_chase and !taking_damage:
			var dir_to_player = position.direction_to(player.position) * speed
			velocity.x = dir_to_player.x
			dir.x = abs(velocity.x) / velocity.x
			
		elif taking_damage:
			var knockback_dir = position.direction_to(player.position) * knockback_force
			velocity.x = knockback_dir.x
		is_roaming = true
	elif dead:
		velocity.x = 0
	

func handle_animation():
	var ani_sprite = $AnimatedSprite2D
	
	if !dead and !taking_damage and !is_dealing_damage:
		ani_sprite.play("walk")
		if dir.x == -1:
			ani_sprite.flip_h = true
		elif dir.x == 1:
			ani_sprite.flip_h = false
	elif !dead and taking_damage and !is_dealing_damage:
		ani_sprite.play("hurt")
		await get_tree().create_timer(0.8).timeout
		taking_damage = false
	elif dead and is_roaming:
		is_roaming = false
		ani_sprite.play("dead_animation")
		await get_tree().create_timer(1.0).timeout
		handle_death()
		
func handle_death():
	self.queue_free()

func _on_timer_timeout() -> void:
	$Timer.wait_time = choose([1.5,2.0,2.5])
	if !is_enemy_chase:
		dir = choose([Vector2.RIGHT, Vector2.LEFT])
		velocity.x = 0
	
func choose(array):
	array.shuffle()
	return array.front()	


func _on_area_2d_body_entered(body: Node2D) -> void:
	var life_bar: ProgressBar = progress_bar
	var max_value = life_bar.value
	var min_value = life_bar.min_value
	
	var life_enemy_bar = enemy_pb	
	var max_ene_value = life_enemy_bar.value
	var min_ene_valu = life_enemy_bar.min_value
		
	if body == jugador_p:
		life_bar.value = max_value / 2
		
	if body.is_in_group("bullet"):
		body.queue_free()
		self.queue_free()
			
	if life_enemy_bar.value < 1:
		self.queue_free()
