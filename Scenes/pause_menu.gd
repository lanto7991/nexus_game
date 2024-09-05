extends Control

@onready var pauseMenu = $pause


func _on_volver_al_menu_pressed() -> void:
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_quit_pressed() -> void:
	pass # Replace with function body.
	get_tree().quit()
