# BALL
extends CharacterBody2D

signal out_of_bounds

var speed = 200

func _ready():
	
	var direction_x = randf_range(-1, 1)
	var direction_y = -1
	
	velocity = Vector2(direction_x, direction_y).normalized() * speed

func _physics_process(delta):
		
	if position.y <= 0 or position.y >= get_viewport_rect().size.y:
		velocity.y *= -1
		
	if position.x <= 0 or position.x >= get_viewport_rect().size.x:
		velocity.x *= -1

	var collision = move_and_collide(velocity * delta)

	if collision:
		# $AudioStreamPlayer2D.play()
		velocity = velocity.bounce(collision.get_normal())
		if collision.has_method("break_block"):
			collision.break_block()
			
