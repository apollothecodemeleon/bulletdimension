extends Node2D

var speed: float
var direction: Vector2 = Vector2.RIGHT
var duration: int = 0
var seekertimer = 0
var offset = 100
var seeking
var white = false
var targetpos
var markerpos
@onready var player : Node2D = $"../Player" 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	targetpos = position.direction_to(player.position)
	direction = targetpos
	markerpos = player.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	duration +=1
	$Marker.global_position = markerpos
	if white:
		$Marker.color = Color(0.0, 1.0, 0.0, 1.0)
		white = false
	else:
		$Marker.color = Color(1.0, 1.0, 1.0, 1.0)
		white = true
	if duration == 100:
		direction = position.direction_to(player.position)
		markerpos = player.global_position
	if duration == 300:
		queue_free()
	
	
	
	
