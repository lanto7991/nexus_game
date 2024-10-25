extends Node2D

@onready var player = $"../Player"
@onready var marker_position = $"../Marker2D"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_escalera_body_entered(body: Node2D) -> void:
	if body == player:
		body.global_position = Global.marker_position
