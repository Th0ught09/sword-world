extends Area2D
signal hit

func _ready():
	pass

func _process(delta):
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


func _on_body_entered(body:Node2D) -> void:
	body.queue_free()
	hit.emit()
	pass # Replace with function body.
