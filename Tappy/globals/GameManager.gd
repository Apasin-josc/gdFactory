extends Node

const GAME = preload("res://scenes/game/Game.tscn")
const MAIN = preload("res://scenes/main/Main.tscn")
const SIMPLE_TRANSITION = preload("res://scenes/simpletransition/SimpleTransition.tscn")

var next_scene: PackedScene

func load_game_scene() -> void:
	next_scene = GAME
	get_tree().change_scene_to_packed(SIMPLE_TRANSITION)

func load_main_scene() -> void:
	next_scene = MAIN
	get_tree().change_scene_to_packed(SIMPLE_TRANSITION)
