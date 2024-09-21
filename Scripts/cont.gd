extends Node2D

@export var seconds : float
var restTime : float
@export var loop : bool

var v_score: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	restTime = seconds


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	restTime -= delta
	
	if restTime <= 0:
		
		if loop:
			v_score += 100
			restTime = seconds
			print ("Your score is: " + str(v_score))
		else:
			print ("Score stop")
