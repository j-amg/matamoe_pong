extends StaticBody2D

class_name Block
signal block_broken

func break_block():
	emit_signal("block_broken")
	queue_free();
