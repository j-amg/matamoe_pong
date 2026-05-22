# PADDLE
extends CharacterBody2D

var speed = 800

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1 # In 2D, negative Y is up
	elif Input.is_action_pressed("ui_right"):
		direction = 1 # Positive Y is down
		
	velocity.x = direction * speed;
	velocity.y = 0
	
	move_and_collide(velocity * delta)
	position.x = clamp(position.x, 0, get_viewport_rect().size.x)
