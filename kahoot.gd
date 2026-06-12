extends Node

var x = 5

func _ready() -> void:
	print(changeVal1(x))
		
func changeVal1(num: int) -> int:
	num -= 2
	return num
