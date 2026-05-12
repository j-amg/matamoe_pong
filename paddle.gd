extends CharacterBody2D

var speed = 800

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = 0
	if Input.is_action_pressed("ui_up"):
		direction = -1 # In 2D, negative Y is up
	elif Input.is_action_pressed("ui_down"):
		direction = 1 # Positive Y is down
	
	velocity.x = 0
	velocity.y = direction * speed;
	
	move_and_collide(velocity * delta)
	
	position.y = clamp(position.y, 0, get_viewport_rect().size.y)
