extends StaticBody2D

class_name Block

@export var colorRect: ColorRect

signal broken

func break_block():
	emit_signal("broken", self)
	queue_free();
