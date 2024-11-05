extends Control

@onready var audio_main_menu = $audio_main_menu

func _ready() -> void:
	audio_main_menu.play()
	

func _on_play_pressed() -> void:
	audio_main_menu.stop()
	get_tree().change_scene_to_file("res://Scenes/load_scene.tscn")
	


func _on_exit_pressed() -> void:
	audio_main_menu.stop()
	get_tree().quit()
	

func _on_options_pressed() -> void:
	audio_main_menu.stop()
	get_tree().change_scene_to_file("res://Scenes/options_scene.tscn")
	
