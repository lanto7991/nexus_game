extends Control

@onready var sfx_sound_back = $AudioStreamPlayer2D

@onready var check_comp = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sfx_sound_back.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_backmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_total_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value/5)


func _on_resolution_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))


func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif toggled_on != true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)	


func _on_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)
