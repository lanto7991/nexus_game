extends Control


func _on_continuar_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/world_2.tscn")


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
