extends StaticBody2D

var velocidad: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x += velocidad * delta


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
