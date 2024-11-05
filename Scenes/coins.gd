extends Node2D

@onready var player = $"../Player"
@onready var coins_sound = $"../Coins"
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		coins_sound.play()		
		Global.contador += 1
		queue_free()
