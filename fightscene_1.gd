extends Node2D

const BBULLET = preload("res://bullets/base_bullet.tscn")
const HEXBULLET = preload("res://bullets/bulletring.tscn")
const GRENADEBULLET = preload("res://bullets/grenadebullet.tscn")
const SPEARBULLET = preload("res://bullets/spear_bullet.tscn")
const ARROWBULLET = preload("res://bullets/arrow_bullet.tscn")

var bosshealth = 350
@onready var player_position = $Player.position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#await get_tree().create_timer(5).timeout
	#await attack_1() #First cascade
	#await attack_2() # Second cascade
	#$Boss1/AnimationPlayer.play("sideshoot")
	##side thingy
	#await get_tree().create_timer(1.5).timeout
	#attack_3()
	#attack_4()
	#await get_tree().create_timer(2).timeout
	#attack_3()
	#attack_4()
	#await get_tree().create_timer(2).timeout
	#attack_3()
	#attack_4()
	#$Boss1/AnimationPlayer.play_backwards("sideshoot")
	#await get_tree().create_timer(4).timeout
	#$Boss1/AnimationPlayer.play("move to center")
	##Cascade, followed by
	#await attack_2()
	#$Boss1/AnimationPlayer.play("spin_center")
	##spinny ray
	#await attack_5()
	#$Boss1/AnimationPlayer.play_backwards("spin_center")
	##Spinny ray other direction
	#await attack_8()
	#$Boss1/AnimationPlayer.play_backwards("move to center")
	#attack_6()
	#await attack_7()
	#await attack_9()
	#await get_tree().create_timer(2).timeout
	
	$Label.text = "3"
	await get_tree().create_timer(1).timeout
	$Label.text = "2"
	await get_tree().create_timer(1).timeout
	$Label.text = "1"
	await get_tree().create_timer(1).timeout
	$Label.text = ""
	await section_1()
	$Player.health = 10
	await section_2()
	$Player.health = 10
	await section_3()
	$Player.health = 10
	await section_4()
	$Player.health = 10
	await section_5()
	$Player.health = 10
	await section_6()
	await get_tree().create_timer(2).timeout
	$Label.text = "YOU WON"
	
	#attack_11()
	#await get_tree().create_timer(2.5).timeout
	#attack_11()
	#await get_tree().create_timer(2.5).timeout
	##Grenade sequence part one
	#spawn_grenadebullet(Vector2.DOWN, 200, Vector2(500, -514), 60)
	#await get_tree().create_timer(1).timeout
	#spawn_grenadebullet(Vector2.DOWN, 200, Vector2(0, -514), 60)
	#await get_tree().create_timer(1).timeout
	#spawn_grenadebullet(Vector2.DOWN, 200, Vector2(-500, -514), 60)
	#await get_tree().create_timer(2.5).timeout
	#spawn_grenadebullet(Vector2.UP, 200, Vector2(-500, 514), 60)
	#await get_tree().create_timer(1).timeout
	#spawn_grenadebullet(Vector2.UP, 200, Vector2(0, 514), 60)
	#await get_tree().create_timer(1).timeout
	#spawn_grenadebullet(Vector2.UP, 200, Vector2(500, 514), 60)
	#await get_tree().create_timer(1).timeout
	#attack_3()
	#attack_4()
	#await get_tree().create_timer(randf_range(0.5, 2)).timeout
	#spawn_grenadebullet(Vector2.ZERO, 0, Vector2($Player.position.x - randi_range(-200, 200), $Player.position.y - randi_range(-200, 200)), 60)
	#await get_tree().create_timer(1).timeout
	#attack_3()
	#attack_4()
	#await get_tree().create_timer(randf_range(0.5, 2)).timeout
	#spawn_grenadebullet(Vector2.ZERO, 0, Vector2($Player.position.x - randi_range(-200, 200), $Player.position.y - randi_range(-200, 200)), 60)
	#await get_tree().create_timer(1).timeout
	#attack_3()
	#attack_4()
	#await get_tree().create_timer(randf_range(0.5, 2)).timeout
	#spawn_grenadebullet(Vector2.ZERO, 0, Vector2($Player.position.x - randi_range(-200, 200), $Player.position.y - randi_range(-200, 200)), 60)

	#attack_3()
	#attack_4()
	#await get_tree().create_timer(0.75).timeout
	#attack_13()
	#await get_tree().create_timer(2).timeout
	#attack_3()
	#attack_4()
	#await get_tree().create_timer(0.75).timeout
	#attack_13()
	#await get_tree().create_timer(2).timeout
	#attack_13()
	#await get_tree().create_timer(0.75).timeout
	#attack_13()
	#await get_tree().create_timer(0.75).timeout
	#attack_13()
	#await get_tree().create_timer(0.75).timeout
	#attack_13()
	#await get_tree().create_timer(0.75).timeout
	#attack_13()
	#await get_tree().create_timer(0.75).timeout
	#attack_13()
	#await get_tree().create_timer(0.75).timeout
	#attack_13()
	#await get_tree().create_timer(2).timeout
	#attack_13()
	#attack_14()
	#await get_tree().create_timer(2).timeout
	#attack_13()
	#attack_14()
	#await get_tree().create_timer(2).timeout
	#attack_13()
	#attack_14()
	
	#await get_tree().create_timer(2).timeout
	#attack_11()
	#await get_tree().create_timer(1).timeout
	#attack_13()
	#attack_14()
	
	#await get_tree().create_timer(2).timeout
	#attack_11()
	#await get_tree().create_timer(1).timeout
	#attack_13()
	#attack_14()
	#await get_tree().create_timer(2).timeout
	#attack_13()
	#await get_tree().create_timer(1).timeout
	#attack_14()
	#await get_tree().create_timer(1).timeout
	#attack_13()
	#await get_tree().create_timer(1).timeout
	#attack_14()
	#await get_tree().create_timer(1).timeout
	#attack_13()
	#await get_tree().create_timer(1).timeout
	#attack_14()
	#await get_tree().create_timer(1).timeout
	#attack_13()
	#await get_tree().create_timer(3).timeout
	#spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	
#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$ProgressBar2.value = bosshealth


func spawn_bbullet(dir: Vector2, speed: float, start_pos: Vector2):
	var bullet_instance = BBULLET.instantiate()
	bullet_instance.direction = dir
	bullet_instance.speed = speed
	bullet_instance.position = start_pos
	add_child(bullet_instance)

func spawn_hexbullet(dir: Vector2, speed: float, start_pos: Vector2):
	var hex_instance = HEXBULLET.instantiate()
	hex_instance.direction = dir
	hex_instance.speed = speed
	hex_instance.position = start_pos
	add_child(hex_instance)
	
func spawn_grenadebullet(dir: Vector2, speed: float, start_pos: Vector2, fuse: int):
	var grenade_instance = GRENADEBULLET.instantiate()
	grenade_instance.direction = dir
	grenade_instance.speed = speed
	grenade_instance.position = start_pos
	grenade_instance.fusetime = fuse
	add_child(grenade_instance)
	
func spawn_spearbullet(speed: float, start_pos: Vector2):
	var spear_instance = SPEARBULLET.instantiate()
	spear_instance.speed = speed
	spear_instance.position = start_pos
	add_child(spear_instance)
	
func spawn_arrowbullet(dir: Vector2, speed: float, start_pos: Vector2):
	var arrow_instance = ARROWBULLET.instantiate()
	arrow_instance.direction = dir
	arrow_instance.speed = speed
	arrow_instance.position = start_pos
	add_child(arrow_instance)
func attack_1():
	var xcoord = -913
	for i in 50:
		spawn_bbullet(Vector2.DOWN, 500, Vector2(xcoord, -514))
		await get_tree().create_timer(0.05).timeout
		xcoord += 30
		i += 1
func attack_2():
	var xcoord = 913
	for i in 50:
		spawn_bbullet(Vector2.DOWN, 500, Vector2(xcoord, -514))
		await get_tree().create_timer(0.05).timeout
		xcoord -= 30
		i += 1
func attack_3() -> void:
	var ycoord = -514
	for i in 21:
		spawn_bbullet(Vector2.RIGHT, 750, Vector2(-914, ycoord))
		ycoord += 25
		i -=1
func attack_4():
	var ycoord = 514
	for i in 21:
		spawn_bbullet(Vector2.LEFT, 750, Vector2(914, ycoord))
		ycoord -= 25
		i +=1
func attack_5():
	var spinnyvector1: = Vector2.RIGHT
	var spinnyvector2: = Vector2.LEFT
	var spinnyvector3: = Vector2.UP
	var spinnyvector4: = Vector2.DOWN
	for i in 40:
		spawn_bbullet(Vector2(spinnyvector1), 500, Vector2(0, 0))
		spawn_bbullet(Vector2(spinnyvector2), 500, Vector2(0, 0))
		spawn_bbullet(Vector2(spinnyvector3), 500, Vector2(0, 0))
		spawn_bbullet(Vector2(spinnyvector4), 500, Vector2(0, 0))
		await get_tree().create_timer(0.15).timeout
		spinnyvector1 = spinnyvector1.rotated(deg_to_rad(9))
		spinnyvector2 = spinnyvector2.rotated(deg_to_rad(9))
		spinnyvector3 = spinnyvector3.rotated(deg_to_rad(9))
		spinnyvector4 = spinnyvector4.rotated(deg_to_rad(9))
		i +=1
func attack_6():
	var spinnyvector1: = Vector2.RIGHT
	var spinnyvector2: = Vector2.LEFT
	var spinnyvector3: = Vector2.UP
	var spinnyvector4: = Vector2.DOWN
	for i in 20:
		spawn_bbullet(Vector2(spinnyvector1), 500, Vector2(456, 0))
		spawn_bbullet(Vector2(spinnyvector2), 500, Vector2(456, 0))
		spawn_bbullet(Vector2(spinnyvector3), 500, Vector2(456, 0))
		spawn_bbullet(Vector2(spinnyvector4), 500, Vector2(456, 0))
		await get_tree().create_timer(0.15).timeout
		spinnyvector1 = spinnyvector1.rotated(deg_to_rad(9))
		spinnyvector2 = spinnyvector2.rotated(deg_to_rad(9))
		spinnyvector3 = spinnyvector3.rotated(deg_to_rad(9))
		spinnyvector4 = spinnyvector4.rotated(deg_to_rad(9))
		i +=1
func attack_7():
	var spinnyvector1: = Vector2.RIGHT
	var spinnyvector2: = Vector2.LEFT
	var spinnyvector3: = Vector2.UP
	var spinnyvector4: = Vector2.DOWN
	for i in 20:
		spawn_bbullet(Vector2(spinnyvector1), 500, Vector2(-456, 0))
		spawn_bbullet(Vector2(spinnyvector2), 500, Vector2(-456, 0))
		spawn_bbullet(Vector2(spinnyvector3), 500, Vector2(-456, 0))
		spawn_bbullet(Vector2(spinnyvector4), 500, Vector2(-456, 0))
		await get_tree().create_timer(0.15).timeout
		spinnyvector1 = spinnyvector1.rotated(deg_to_rad(-9))
		spinnyvector2 = spinnyvector2.rotated(deg_to_rad(-9))
		spinnyvector3 = spinnyvector3.rotated(deg_to_rad(-9))
		spinnyvector4 = spinnyvector4.rotated(deg_to_rad(-9))
		i +=1
func attack_8():
	var spinnyvector1: = Vector2.RIGHT
	var spinnyvector2: = Vector2.LEFT
	var spinnyvector3: = Vector2.UP
	var spinnyvector4: = Vector2.DOWN
	for i in 40:
		spawn_bbullet(Vector2(spinnyvector1), 500, Vector2(0, 0))
		spawn_bbullet(Vector2(spinnyvector2), 500, Vector2(0, 0))
		spawn_bbullet(Vector2(spinnyvector3), 500, Vector2(0, 0))
		spawn_bbullet(Vector2(spinnyvector4), 500, Vector2(0, 0))
		await get_tree().create_timer(0.15).timeout
		spinnyvector1 = spinnyvector1.rotated(deg_to_rad(-9))
		spinnyvector2 = spinnyvector2.rotated(deg_to_rad(-9))
		spinnyvector3 = spinnyvector3.rotated(deg_to_rad(-9))
		spinnyvector4 = spinnyvector4.rotated(deg_to_rad(-9))
		i +=1
func attack_9():
	var xcoord1 = -913
	var xcoord = 913
	for i in 28:
		spawn_bbullet(Vector2.DOWN, 500, Vector2(xcoord1, -514))
		spawn_bbullet(Vector2.DOWN, 500, Vector2(xcoord, -514))
		await get_tree().create_timer(0.05).timeout
		xcoord1 += 30
		xcoord -= 30
		i += 1
	
func attack_10():
	var xcoord1 = -73
	var xcoord = 73
	for i in 28:
		spawn_bbullet(Vector2.DOWN, 500, Vector2(xcoord1, -514))
		spawn_bbullet(Vector2.DOWN, 500, Vector2(xcoord, -514))
		await get_tree().create_timer(0.05).timeout
		xcoord1 += -30
		xcoord -= -30
		i += 1
func attack_11():
	spawn_hexbullet(Vector2(1, 1), 500, Vector2(-920, -520))
	spawn_hexbullet(Vector2(-1, 1), 500, Vector2(920, -520))
func attack_12():
	spawn_grenadebullet(Vector2.DOWN, 100, Vector2(0, -514), 100)
func attack_13():
	await get_tree().create_timer(1).timeout
	var xcoord = $Player.position.x - randi_range(-200, 200)
	for i in 120:
		spawn_bbullet(Vector2.DOWN, 1500, Vector2(xcoord, -520))
		await get_tree().create_timer(0.01).timeout
		i +=1

func attack_14():
	await get_tree().create_timer(1).timeout
	var ycoord = $Player.position.y - randi_range(-200, 200)
	for i in 120:
		spawn_bbullet(Vector2.LEFT, 1500, Vector2(936, ycoord))
		await get_tree().create_timer(0.01).timeout
		i +=1
		
func section_1():
	await attack_1() #First cascade
	await attack_2() # Second cascade
	$Boss1/AnimationPlayer.play("sideshoot")
	#side thingy
	await get_tree().create_timer(1.5).timeout
	attack_3()
	attack_4()
	await get_tree().create_timer(2).timeout
	attack_3()
	attack_4()
	await get_tree().create_timer(2).timeout
	attack_3()
	attack_4()
	$Boss1/AnimationPlayer.play_backwards("sideshoot")
	await get_tree().create_timer(4).timeout
	$Boss1/AnimationPlayer.play("move to center")
	#Cascade, followed by
	await attack_2()
	$Boss1/AnimationPlayer.play("spin_center")
	#spinny ray
	await attack_5()
	$Boss1/AnimationPlayer.play_backwards("spin_center")
	#Spinny ray other direction
	await attack_8()
	$Boss1/AnimationPlayer.play_backwards("move to center")
	attack_6()
	await attack_7()
	await attack_9()
	await get_tree().create_timer(2).timeout
func section_2():
	attack_11()
	await get_tree().create_timer(2.5).timeout
	attack_11()
	await get_tree().create_timer(2.5).timeout
	#Grenade sequence part one
	spawn_grenadebullet(Vector2.DOWN, 200, Vector2(500, -514), 60)
	await get_tree().create_timer(1).timeout
	spawn_grenadebullet(Vector2.DOWN, 200, Vector2(0, -514), 60)
	await get_tree().create_timer(1).timeout
	spawn_grenadebullet(Vector2.DOWN, 200, Vector2(-500, -514), 60)
	await get_tree().create_timer(2.5).timeout
	spawn_grenadebullet(Vector2.UP, 200, Vector2(-500, 514), 60)
	await get_tree().create_timer(1).timeout
	spawn_grenadebullet(Vector2.UP, 200, Vector2(0, 514), 60)
	await get_tree().create_timer(1).timeout
	spawn_grenadebullet(Vector2.UP, 200, Vector2(500, 514), 60)
	await get_tree().create_timer(1).timeout
	attack_3()
	attack_4()
	await get_tree().create_timer(randf_range(0.5, 2)).timeout
	spawn_grenadebullet(Vector2.ZERO, 0, Vector2($Player.position.x - randi_range(-200, 200), $Player.position.y - randi_range(-200, 200)), 60)
	await get_tree().create_timer(1).timeout
	attack_3()
	attack_4()
	await get_tree().create_timer(randf_range(0.5, 2)).timeout
	spawn_grenadebullet(Vector2.ZERO, 0, Vector2($Player.position.x - randi_range(-200, 200), $Player.position.y - randi_range(-200, 200)), 60)
	await get_tree().create_timer(1).timeout
	attack_3()
	attack_4()
	await get_tree().create_timer(randf_range(0.5, 2)).timeout
	spawn_grenadebullet(Vector2.ZERO, 0, Vector2($Player.position.x - randi_range(-200, 200), $Player.position.y - randi_range(-200, 200)), 60)
func section_3():
	attack_3()
	attack_4()
	await get_tree().create_timer(0.75).timeout
	attack_13()
	await get_tree().create_timer(2).timeout
	attack_3()
	attack_4()
	await get_tree().create_timer(0.75).timeout
	attack_13()
	await get_tree().create_timer(2).timeout
	attack_13()
	await get_tree().create_timer(0.75).timeout
	attack_13()
	await get_tree().create_timer(0.75).timeout
	attack_13()
	await get_tree().create_timer(0.75).timeout
	attack_13()
	await get_tree().create_timer(0.75).timeout
	attack_13()
	await get_tree().create_timer(0.75).timeout
	attack_13()
	await get_tree().create_timer(0.75).timeout
	attack_13()
	await get_tree().create_timer(2).timeout
	attack_13()
	attack_14()
	await get_tree().create_timer(2).timeout
	attack_13()
	attack_14()
	await get_tree().create_timer(2).timeout
	attack_13()
	attack_14()
	await get_tree().create_timer(2).timeout
	attack_11()
	await get_tree().create_timer(1).timeout
	attack_13()
	attack_14()
func section_4():
	await get_tree().create_timer(2).timeout
	attack_11()
	await get_tree().create_timer(1).timeout
	attack_13()
	attack_14()
	await get_tree().create_timer(2).timeout
	attack_13()
	await get_tree().create_timer(1).timeout
	attack_14()
	await get_tree().create_timer(1).timeout
	attack_13()
	await get_tree().create_timer(1).timeout
	attack_14()
	await get_tree().create_timer(1).timeout
	attack_13()
	await get_tree().create_timer(1).timeout
	attack_14()
	await get_tree().create_timer(1).timeout
	attack_13()
	await get_tree().create_timer(3).timeout
	#spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
func section_5():
	await get_tree().create_timer(3).timeout
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	await get_tree().create_timer(1).timeout
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	await get_tree().create_timer(1).timeout
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	await get_tree().create_timer(1).timeout
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	await get_tree().create_timer(1).timeout
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	await get_tree().create_timer(1).timeout
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	await get_tree().create_timer(1).timeout
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	await get_tree().create_timer(1).timeout
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	await get_tree().create_timer(1).timeout
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
func section_6():
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	await get_tree().create_timer(0.5).timeout
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	spawn_hexbullet(Vector2(0,0), 500, Vector2(0,-520))
	await get_tree().create_timer(2).timeout
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	await get_tree().create_timer(0.5).timeout
	spawn_arrowbullet(Vector2(1, 1), 1000, Vector2(-920, -520))
	spawn_hexbullet(Vector2(0,0), 500, Vector2(0,-520))
	await get_tree().create_timer(3).timeout
	attack_5()
	attack_13()
	attack_14()
	await get_tree().create_timer(2.5).timeout
	attack_13()
	attack_14()
	await get_tree().create_timer(2).timeout
	attack_8()
	await get_tree().create_timer(2).timeout
	attack_13()
	attack_14()
	await get_tree().create_timer(5).timeout
	spawn_arrowbullet(Vector2(0,0), 800, Vector2(-920, -520))
	spawn_arrowbullet(Vector2(0,0), 800, Vector2(0, -520))
	spawn_arrowbullet(Vector2(0,0), 800, Vector2(920, -520))
	await get_tree().create_timer(2.5).timeout
	spawn_arrowbullet(Vector2(0,0), 800, Vector2(-920, -520))
	spawn_arrowbullet(Vector2(0,0), 800, Vector2(0, -520))
	spawn_arrowbullet(Vector2(0,0), 800, Vector2(920, -520))
	await get_tree().create_timer(2.5).timeout
	attack_3()
	attack_4()
	spawn_arrowbullet(Vector2(0,0), 800, Vector2(-920, -520))
	spawn_arrowbullet(Vector2(0,0), 800, Vector2(0, -520))
	spawn_arrowbullet(Vector2(0,0), 800, Vector2(920, -520))
	await get_tree().create_timer(2.5).timeout
	attack_3()
	attack_4()
	spawn_arrowbullet(Vector2(0,0), 800, Vector2(-920, -520))
	spawn_arrowbullet(Vector2(0,0), 800, Vector2(0, -520))
	spawn_arrowbullet(Vector2(0,0), 800, Vector2(920, -520))
	await get_tree().create_timer(4).timeout
	spawn_grenadebullet(Vector2.DOWN, 200, Vector2(500, -514), 60)
	spawn_grenadebullet(Vector2.DOWN, 200, Vector2(0, -514), 60)
	
	spawn_grenadebullet(Vector2.DOWN, 200, Vector2(-500, -514), 60)
	
	spawn_grenadebullet(Vector2.UP, 200, Vector2(-500, 514), 60)
	
	spawn_grenadebullet(Vector2.UP, 200, Vector2(0, 514), 60)
	
	spawn_grenadebullet(Vector2.UP, 200, Vector2(500, 514), 60)
	
	await get_tree().create_timer(2).timeout
	spawn_grenadebullet(Vector2.DOWN, 200, Vector2(500, -514), 60)
	spawn_grenadebullet(Vector2.DOWN, 200, Vector2(0, -514), 60)
	
	spawn_grenadebullet(Vector2.DOWN, 200, Vector2(-500, -514), 60)
	
	spawn_grenadebullet(Vector2.UP, 200, Vector2(-500, 514), 60)
	
	spawn_grenadebullet(Vector2.UP, 200, Vector2(0, 514), 60)
	
	spawn_grenadebullet(Vector2.UP, 200, Vector2(500, 514), 60)
	await get_tree().create_timer(2).timeout
	spawn_grenadebullet(Vector2.DOWN, 200, Vector2(500, -514), 60)
	spawn_grenadebullet(Vector2.DOWN, 200, Vector2(0, -514), 60)
	
	spawn_grenadebullet(Vector2.DOWN, 200, Vector2(-500, -514), 60)
	
	spawn_grenadebullet(Vector2.UP, 200, Vector2(-500, 514), 60)
	
	spawn_grenadebullet(Vector2.UP, 200, Vector2(0, 514), 60)
	
	spawn_grenadebullet(Vector2.UP, 200, Vector2(500, 514), 60)
	
	
	
