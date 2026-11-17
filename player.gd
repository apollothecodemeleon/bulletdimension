extends CharacterBody2D


const SPEED = 600
const JUMP_VELOCITY = -400.0
var health = 10
var regentimer = 0
var pistoltimer = 0
var pistolcooldown = false
var shootenabled = true
const BULLET = preload("res://player_bullet.tscn")
const FIGHTSCENE = preload("res://fightscene_1.tscn")
func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "forward", "backward")
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	if pistolcooldown == true:
		pistoltimer +=1
	if pistoltimer > 24:
		pistolcooldown = false
		pistoltimer = 0
	regentimer +=1
	if regentimer >600:
		health +=1
		regentimer = 0
	if health < 1:
		print("you died")
		get_tree().reload_current_scene()
	if health >10:
		health = 10
	if pistolcooldown == false and shootenabled:
		pistol_shoot()
		pistolcooldown = true
	$ProgressBar.value = pistoltimer
	if Input.is_action_just_pressed("enable shoot"):
		shootenabled = !shootenabled
	print($DamageCooldown.time_left)
	
	
func take_damage(dmg):
	if $DamageCooldown.is_stopped():
		health = health - dmg
		$DamageCooldown.start()
	else:
		pass

func shoot_bullet(dir: Vector2, speed: float):
	var bullet_instance = BULLET.instantiate()
	bullet_instance.direction = dir
	bullet_instance.speed = speed
	add_child(bullet_instance)
	bullet_instance.reparent($"..")

func pistol_shoot():
	shoot_bullet(Vector2(get_global_mouse_position() - position), 3.5)
	
