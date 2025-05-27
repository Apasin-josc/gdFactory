extends Control

#var MAIN = load("res://scenes/main/Main.tscn")
@onready var game_over_label: Label = $GameOverLabel
@onready var press_space_label: Label = $PressSpaceLabel
@onready var timer: Timer = $Timer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit") == true:
		#print("_unhandled_input:", event)
		#get_tree().change_scene_to_packed(MAIN)
		GameManager.load_main_scene()
	elif press_space_label.visible == true and event.is_action_pressed("jump"):
		GameManager.load_main_scene()
		
# Called when the node enters the scene tree for the first time.
func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(on_plane_died)
	

func on_plane_died() -> void:
	game_over_label.show()
	#game_over_label.visible = true
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
	#get_tree().paused = false

func _on_timer_timeout() -> void:
	timer.stop()
	game_over_label.hide()
	press_space_label.show()
