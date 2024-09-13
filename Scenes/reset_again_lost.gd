extends Control


func _on_reset_pressed() -> void:
	get_tree().reload_current_scene()


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
