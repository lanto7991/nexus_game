extends Node2D

@onready var pause_menu = $Player/Camera2D/pause_menu

@onready var win_menu = $CanvasLayer/Control

@onready var player = $Player

var pause = false

var win_bar = false

var winMenuVar = false


func _ready() -> void:
	win_menu.visible = false
	Engine.time_scale = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
		if Input.is_action_just_pressed("pausa") and winMenuVar==false:	
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


		


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body == player:
		winMenuVar = true
		win_menu.visible = true
		Engine.time_scale = 0
		
		
	
