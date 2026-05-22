# LEVEL
extends Node2D

var score = 0

var ballScene = preload("res://ball.tscn")
var blockScene = preload("res://block.tscn")

var block_x = 40
var block_y = 10
	
#func _unhandled_input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
#		if event.button_index == MOUSE_BUTTON_LEFT:
#			if event.pressed:
#				print("Left button was clicked at ", event.position)
#				spawn_ball(get_global_mouse_position())


func _ready() -> void:
	spawn_blocks()
	spawn_ball()
	
func spawn_blocks():
	for i in range(block_x):
		for j in range(block_y):
			var pos_x = i * get_viewport_rect().size.x / block_x
			var pos_y = j * get_viewport_rect().size.y / 2 / block_y
			var block_inst = blockScene.instantiate()
			add_child(block_inst)
			block_inst.position = Vector2(pos_x, pos_y)


func spawn_ball():
	var ball = ballScene.instantiate()
	ball.out_of_bounds.connect(_on_ball_exited)
	# ball.position = Vector2(get_viewport_rect().size.x / 2, -get_viewport_rect().size.y / 2)
	ball.position = Vector2(1000, 500)
	add_child(ball)
	
	
func _on_block_broken():
	$CanvasLayer/Label.text = "Score: " + str(score)
	score += 1
	
func _on_ball_exited():
	
	spawn_ball()
