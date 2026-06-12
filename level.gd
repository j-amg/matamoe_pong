# LEVEL
extends Node2D

var score = 0

var ballScene = preload("res://ball.tscn")
var blockScene = preload("res://block.tscn")
var spawnerBlockScene = preload("res://spawner_block.tscn")

var block_x = 20
var block_y = 10

func _ready() -> void:
	spawn_blocks()
	spawn_ball()
	
func _on_block_broken(block: Block):
	$CanvasLayer/Label.text = "Score: " + str(score)
	score += 1
	
	if block is SpawnerBlock:
		spawn_ball()
	
func spawn_blocks():
	for i in range(block_x):
		for j in range(block_y):
			var pos_x = (i * get_viewport_rect().size.x / block_x) + 16
			var pos_y = j * get_viewport_rect().size.y / 2 / block_y + 16
			var block_inst = spawnerBlockScene.instantiate() as Block if (randf() >= 0.9) else blockScene.instantiate() as Block
			var block_col = j / 10.0
			print(block_col)
			block_inst.colorRect.modulate = Color(block_col, 0, 0)
			add_child(block_inst)
			block_inst.position = Vector2(pos_x, pos_y)
			block_inst.broken.connect(_on_block_broken)

func spawn_ball():
	var ball = ballScene.instantiate()
	ball.out_of_bounds.connect(_on_ball_exited)
	# ball.position = Vector2(get_viewport_rect().size.x / 2, -get_viewport_rect().size.y / 2)
	ball.position = Vector2(1000, 500)
	add_child(ball)
	
func _on_ball_exited():
	
	spawn_ball()
