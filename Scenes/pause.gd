extends Node2D

<<<<<<< HEAD


=======
>>>>>>> 58c70b98c04bc3e19fda2d912d08bc1f620cae8d
@onready var pauseMenu = $Player/Camera2D/PauseMenu
var pause = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if Input.is_action_just_pressed("pausa"):	
		pausaMenu()	


func pausaMenu():
	if pause:
		pausaMenu().hide()
		Engine.time_scale = 1
	else:
		pausaMenu().show()
		Engine.time_scale = 0
		
	pause = !pause
