extends Control

@onready var audio_main_menu = $"../audio_main_menu"

func _ready() -> void:
	audio_main_menu.play()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/load_scene.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
