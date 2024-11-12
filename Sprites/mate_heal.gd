extends Node2D

@onready var player = $"../Player"

@onready var progress_bar = $"../Player/Camera2D/ProgressBarLife"

@onready var sonido = $sound_mate

func _on_body_entered(body: Node2D) -> void:
	var life_bar: ProgressBar = progress_bar
	var max_value = life_bar.value
	var min_value = life_bar.min_value
	
	if body == player:
		sonido.play()
		life_bar.value = max_value * 2
		self.queue_free()
		
	
