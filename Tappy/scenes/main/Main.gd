extends Control


#const GAME = preload("res://scenes/game/Game.tscn")


#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("jump") == true:
		#print("_input:", event)
		#get_viewport().set_input_as_handled()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") == true:
		print("_unhandled_input:", event)
		#get_tree().change_scene_to_packed(GAME)
		GameManager.load_game_scene()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
