extends Area2D

var speed: Vector2

func _ready() -> void:
	await get_tree().create_timer(3).timeout
	queue_free()
	
func _physics_process(delta: float) -> void:
	position += speed * delta
