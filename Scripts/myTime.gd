extends Node2D

@export var seconds : float
var restTime : float
@export var loop : bool

var contador: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	restTime = seconds


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	restTime -= delta
	
	if restTime <= 0:
		
		if loop:
			contador += 1
			restTime = seconds
			print ("The time is: " + str(contador))
		elif restTime > 20:
			loop = false
			contador * 0
			seconds = 0
			restTime = seconds
		else:
			print ("Time stop")
