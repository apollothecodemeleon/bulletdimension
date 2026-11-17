extends Node2D

var speed: float
var direction: Vector2 = Vector2.RIGHT
var timer = 0
var fusetime = 120
var detonated = false
const BBULLET = preload("res://bullets/base_bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	timer +=1
	if timer > fusetime and detonated == false:
		detonate()
		
func spawn_bbullet(dir: Vector2, speed: float, start_pos: Vector2):
	var bullet_instance = BBULLET.instantiate()
	bullet_instance.direction = dir
	bullet_instance.speed = speed
	bullet_instance.position = start_pos
	add_child(bullet_instance)
func detonate():
	spawn_bbullet(Vector2(1, 1), 750, Vector2(0,0))
	spawn_bbullet(Vector2(1, 0), 750, Vector2(0,0))
	spawn_bbullet(Vector2(0, 1), 750, Vector2(0,0))
	spawn_bbullet(Vector2(-1, 0), 750, Vector2(0,0))
	spawn_bbullet(Vector2(0, -1), 750, Vector2(0,0))
	spawn_bbullet(Vector2(-1, -1), 750, Vector2(0,0))
	spawn_bbullet(Vector2(-1, 1), 750, Vector2(0,0))
	spawn_bbullet(Vector2(1, -1), 750, Vector2(0,0))
	detonated = true
	direction = Vector2(0,0)
	$Sprite2D.queue_free()
	
