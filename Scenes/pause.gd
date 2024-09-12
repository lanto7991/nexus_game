extends Node2D

@onready var pause_menu = $Player/Camera2D/pause_menu

@onready var win_menu = $Player/Camera2D/Control

var pause = false

var win_bar = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if Input.is_action_just_pressed("pausa"):	
		pauseMenu()	


func pauseMenu():
	if pause:
		pause_menu.hide()
		Engine.time_scale = 1
		#AudioStreamPlayer2D.playing = true --> Renaudar Musica
	else:
		pause_menu.show()
		Engine.time_scale = 0
		#AudioStreamPlayer2D.playing = false --> Pausar musica
	pause = !pause

func _wingame():
	if !win_bar:		
		win_menu.hide()
		Engine.time_scale = 1
	else:
		win_menu.show()
		Engine.time_scale = 0


		
