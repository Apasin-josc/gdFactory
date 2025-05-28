extends Control


#const GAME = preload("res://scenes/game/Game.tscn")
@onready var high_score_label: Label = $MarginContainer/HighScoreLabel


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
	get_tree().paused = false
	high_score_label.text = "%04d" % ScoreManager.high_score

	
