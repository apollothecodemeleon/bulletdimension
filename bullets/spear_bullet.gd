extends Node2D

var speed: float
var target_coord : Vector2
var duration: int
var passes : int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	if passes < 3:
		position += target_coord * speed * delta
	duration +=1
	
		
	passes += 1
	if duration > 1200:
		queue_free()
	
