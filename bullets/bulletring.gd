extends Node2D

var speed: float
var direction: Vector2 = Vector2.RIGHT
var duration = 1200
var seekertimer = 0
var offset = 100
var seeking
var white = true
@onready var player = $"../Player"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if seeking == false:
		for bullet in get_children():
			bullet.colorsquare.color = Color(0.0, 0.306, 1.0, 1.0)
	position += direction * speed * delta
	duration -=1
	if duration < 1:
		queue_free()
	rotate(deg_to_rad(4))
	seekertimer +=1
	if seekertimer < 150:
		seeking = true
		direction = position.direction_to(player.position)
	if seekertimer > 150:
		seeking = false
		
