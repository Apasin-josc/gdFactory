extends Node2D

func _ready() -> void:
	#_add(10,10)
	print(_has_won(199))

func _process(delta: float) -> void:
	pass
	
func _add(a:int, b:int) -> void:
	var sum = a + b
	print(sum)
	
func _welcome_message():
	print("welcome to the game")

func _has_won(score:int) -> bool:
	if(score >= 100):
		return true
	else:
		return false
