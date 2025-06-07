extends Node2D

const MAIN = preload("res://scenes/main/Main.tscn")
const ANIMAL = preload("res://scenes/animal/Animal.tscn")

@onready var animal_start: Marker2D = $AnimalStart

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("escape") == true:
		get_tree().change_scene_to_packed(MAIN)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_animal()

func _enter_tree() -> void:
	SignalHub.on_animal_died.connect(spawn_animal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_animal() -> void:
	var animal = ANIMAL.instantiate()
	animal.position = animal_start.position
	add_child(animal)
