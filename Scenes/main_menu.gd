extends Control



func _on_play_pressed() -> void:
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_exit_pressed() -> void:
	pass # Replace with function body.
	get_tree().quit()
