extends Node2D

@onready var pause_menu = $Player/Camera2D/pause_menu

@onready var win_menu = $CanvasLayer/Control

@onready var reset_menu = $Player/CanvasLayer/RESET_AGAIN_LOST

@onready var player = $Player

@onready var vidas = $Player/vidas

@onready var text_points = $Player/Camera2D/text_points

@onready var enemy_pb = $hitbox/Area_Enemy_Damage/enemy_pb

@onready var progress_bar = $Player/Camera2D/ProgressBarLife

@onready var audio_win = $Area2D2/audio_win

@onready var audio_main = $AudioStreamPlayer

@onready var coin = $coin

@onready var label_coins = $Player/coins_label

var pause = false

var win_bar = false

var winMenuVar = false

var resetMenuVar = false

func _ready() -> void:
	Engine.time_scale = 1
	reset_menu.visible = false
	Global.contador = 0
	Global.vidas_count = 3
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):			
	_resetlevel()
	label_coins.text = str(Global.contador)	
	
	if Input.is_action_just_pressed("pausa") and winMenuVar==false:	
		pauseMenu()	
		
	if Global.vidas_count == 0:
		_resetlevel()	


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


func _resetlevel():
	if progress_bar.value < 1:
		reset_menu.visible = true
		Engine.time_scale = 0	



func _on_area_respawn_body_entered(body: Node2D) -> void:
	if body == player:		
		get_tree().reload_current_scene()

func _on_needle_damage_body_entered(body: Node2D) -> void:
	var life_bar: ProgressBar = progress_bar
	var max_value = life_bar.value
	var min_value = life_bar.min_value
	
	if body == player:
		life_bar.value = max_value / -0.8


func _on_portal_body_entered(body: Node2D) -> void:
	if body == player:
		winMenuVar = true
		win_menu.visible = true
		Engine.time_scale = 0
		
