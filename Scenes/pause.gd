extends Node2D

@onready var pauseMenu = $Player/Camera2D/PauseMenu


var pause = false


func _ready() -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if Input.is_action_just_pressed("pausa"):	
		pausaMenu()	


func pausaMenu():
	if pause:
		#pausaMenu().hide()
		Engine.time_scale = 1
	else:
		#pausaMenu().show()
		Engine.time_scale = 0
	pause = !pause
