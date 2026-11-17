extends Area2D

var damage = 1
var speed: float
var direction: Vector2 = Vector2.RIGHT
var duration = 1200
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta
	duration -=1
	if duration < 1:
		queue_free()
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("shootable"):
		if area.has_method("take_damage"):
			area.take_damage(damage)
			queue_free()
