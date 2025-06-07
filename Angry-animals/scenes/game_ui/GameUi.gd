extends Control

@onready var attempts_label: Label = $MarginContainer/VBoxContainer/AttemptsLabel
@onready var music: AudioStreamPlayer = $Music
@onready var vb_game_over: VBoxContainer = $MarginContainer/VBGameOver
@onready var level_label: Label = $MarginContainer/VBoxContainer/LevelLabel


var _attempts: int = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_label.text = "Level %s" % ScoreManager.level_selected
	on_attempt_made()


func _enter_tree() -> void:
	SignalHub.on_attempt_made.connect(on_attempt_made)
	SignalHub.on_cup_destroyed.connect(on_cup_destroyed)

func on_attempt_made() -> void:
	_attempts += 1
	attempts_label.text = "Attemps %s" % _attempts
	
func on_cup_destroyed(remaining_cups: int) -> void:
	if remaining_cups == 0:
		vb_game_over.show()
		music.play()
		ScoreManager.set_score_for_level(ScoreManager.level_selected, _attempts)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
