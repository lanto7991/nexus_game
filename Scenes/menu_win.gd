extends Control

@onready var main = $"../../../"

func _on_back_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
