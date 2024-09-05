extends CharacterBody2D

class_name enemy_lvl1

const speed = 30

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

var knockback_force = -200
var is_roaming: bool = true

var player: CharacterBody2D
var player_in_area = false

#Movement for a enemy
func _process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity * delta
		velocity.x = 0
		
	player = Global.playerBody
	
	move(delta)
	handle_animation()
	move_and_slide()
	
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
		ani_sprite.play("death")
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
