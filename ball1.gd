extends CharacterBody2D

var speed = 200

func _ready():
	
	var direction_x = randf_range(-1, 1)
	var direction_y = randf_range(-1, 1)
	
	velocity = Vector2(direction_x, direction_y).normalized() * speed

func _physics_process(_delta):
	
	if position.x < 0 or position.x > get_viewport_rect().size.x:
		velocity.x *= -1
		
	if position.y < 0 or position.y > get_viewport_rect().size.y:
		velocity.y *= -1
		
	move_and_slide()
