extends Control

@onready var main = $"../../../"


func _on_volver_al_menu_pressed():	
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_renaudar_pressed() -> void:
	main.pauseMenu()
	
