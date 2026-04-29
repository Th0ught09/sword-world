extends CharacterBody2D

signal hit
@export var speed: int = 100
@export var gravity: int = 100

func _ready():
	pass

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		$AnimatedSprite2D.flip_h = false
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		$AnimatedSprite2D.flip_h = true
	if Input.is_action_pressed("move_down"):
		velocity.y = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = speed
	return velocity

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	if velocity.x != 0 and Input.is_action_pressed("click"):
		$AnimatedSprite2D.play("attack_walk")
	elif velocity.x != 0:
		$AnimatedSprite2D.play("walk")
	elif Input.is_action_pressed("click"):
		$AnimatedSprite2D.play("attack")
	else:
		$AnimatedSprite2D.stop()
	move_and_slide()
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var collision_object = collision_info.get_collider()
		if collision_object.is_in_group("enemy"):
			collision_object.queue_free()
