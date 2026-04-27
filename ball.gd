# FILE: Ball/Ball.gd
extends CharacterBody2D

# This is like an alarm the ball can send out.
signal out_of_bounds

# The speed of the ball.
var speed = 200

# This function is called automatically when the game starts.
func _ready():
	# Put the ball in the middle of the screen
	
	modulate = Color(randf_range(0,255), randf_range(0,255),randf_range(0,255))
	position = get_viewport_rect().size / 2
	var scaleval = randf_range(.1, 5.0)
	scale = Vector2(scaleval, scaleval)
	
	speed = randf_range(20, 1000)
	
	# Give it a random starting direction
	var direction_x = 1.0 if randf() > 0.5 else -1.0
	var direction_y = randf_range(-1, 1)
	
	# Apply the direction and speed. .normalized() keeps the speed consistent.
	velocity = Vector2(direction_x, direction_y).normalized() * speed

func _physics_process(delta):
	# Check if the ball went off the left or right edge
	#if position.x < 0 or position.x > get_viewport_rect().size.x:
		#out_of_bounds.emit() # Sound the alarm!
		#start() # Reset the ball
		
	if position.x < 0 or position.x > get_viewport_rect().size.x:
		velocity.x *= -1
		
	if position.y < 0 or position.y > get_viewport_rect().size.y:
		velocity.y *= -1
	
	# Check if the ball went off the top or bottom edge
	#if position.y < 0 or position.y > get_viewport_rect().size.y:
		#start() # Just reset it for now

	# Move the ball and check if we hit anything
	var collision = move_and_collide(velocity * delta)

	
	# If we hit something...
	if collision:
		#"bounce" is a handy function that reflects the velocity perfectly
		velocity = velocity.bounce(collision.get_normal())
		
		# Let's make the game harder as it goes on
		#var thing_we_hit = collision.get_collider()
		#if thing_we_hit.is_in_group("paddles"):
			#velocity *= 1.05 # Increase speed by 5%
