extends CharacterBody2D

signal hit

func _ready():
	print("starting")
	pass

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 100
		$AnimatedSprite2D.flip_h = false
	if Input.is_action_pressed("move_left"):
		velocity.x -= 100
		$AnimatedSprite2D.flip_h = true
	if Input.is_action_pressed("move_down"):
		velocity.y += 100
	if Input.is_action_pressed("move_up"):
		velocity.y -= 100
	if velocity.length() > 0 and Input.is_action_pressed("click"):
		$AnimatedSprite2D.play("attack_walk")
	elif velocity.length() > 0:
		$AnimatedSprite2D.play("walk")
	elif Input.is_action_pressed("click"):
		$AnimatedSprite2D.play("attack")
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var collision_object = collision_info.get_collider()
		if collision_object.is_in_group("enemy"):
			collision_object.queue_free()
