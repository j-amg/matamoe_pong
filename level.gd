extends Node2D

var score = 0

var ballScene = preload("res://ball.tscn")
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("Left button was clicked at ", event.position)
				spawn_ball(get_global_mouse_position())
			
		
		
func spawn_ball(pos: Vector2):
	var ball = ballScene.instantiate()
	ball.out_of_bounds.connect(_on_ball_exited)
	add_child(ball)
	ball.position = pos
	
func _on_ball_exited():
	score += 1
	$CanvasLayer/Label.text = "Score: " + str(score)
