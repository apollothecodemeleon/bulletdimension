extends Area2D

var speed: float
var direction: Vector2 = Vector2.RIGHT
var duration = 1200
@onready var colorsquare = $Sprite2D/ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	duration -=1
	if duration < 1:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		area.take_damage(1)
		print("hit")
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage(1)
		print("hit")
		queue_free()
