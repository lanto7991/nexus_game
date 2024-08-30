extends Node2D

func _ready() -> void:
	get_tree().change_scene_to_packed(load("res://Scenes/world.tscn"))



#method 1
#@export var load_bar: ProgressBar
#@export var percentage : Label
#var scene_path : String
#var progress : Array

#func _ready() -> void:
#	scene_path = "res://Scenes/world.tscn"
#	ResourceLoader.load_threaded_request(scene_path)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	ResourceLoader.load_threaded_get_status(scene_path, progress)
	
#	load_bar.value = progress[0]
#	percentage.text = str(progress[0]*100.0)
	
#	if load_bar.value >= 1.0:
#		get_tree().change_scene_to_file("res://Scenes/world.tscn")
#		ResourceLoader.load_threaded_get(scene_path)
	
