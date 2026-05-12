# FILE: Ball/Ball.gd
extends CharacterBody2D

signal out_of_bounds

var speed = 200

func _ready():
	$Sprite2D.modulate = Color(randf_range(0,1), randf_range(0,1),randf_range(0,1))
	position = get_viewport_rect().size / 2
	var scaleval = randf_range(1, 3.0)
	scale = Vector2(scaleval, scaleval)
	
	speed = randf_range(20, 1000)
	
	var direction_x = randf_range(-1, 1)
	var direction_y = randf_range(-1, 1)
	
	velocity = Vector2(direction_x, direction_y).normalized() * speed

func _physics_process(delta):
		
	if position.y <= 0 or position.y >= get_viewport_rect().size.y:
		velocity.y *= -1
		
	if position.x <= 0:
		velocity.x *= -1
		
	if position.x >= get_viewport_rect().size.x:
		out_of_bounds.emit()
		queue_free()

	var collision = move_and_collide(velocity * delta)

	if collision:
		# $AudioStreamPlayer2D.play()
		velocity = velocity.bounce(collision.get_normal())
