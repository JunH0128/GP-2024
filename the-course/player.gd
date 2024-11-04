extends CharacterBody2D

signal rocket_shot(rocket_scene, location)

@export var speed = 300

@onready var muzzle = $Muzzle

var rocket_scene =preload("res://Rocket.tscn")

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	var direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	velocity = direction * speed
	move_and_slide()
	
func shoot():
	rocket_shot.emit(rocket_scene, muzzle.global_position)
