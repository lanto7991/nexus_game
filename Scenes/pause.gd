extends Node2D


@onready var pauseMenu = $Player/Camera2D/PauseMenu
var pause = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if Input.is_action_just_pressed("pausa"):	
		pausaMenu()	


func pausaMenu():
	if pause:
		pauseMenu.hide()
		Engine.time_scale = 1
	else:
		pauseMenu.show()
		Engine.time_scale = 0
		
	pause = !pause
