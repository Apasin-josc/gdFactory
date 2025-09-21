extends Area2D

@export var move_direction:Vector2
@export var move_speed:float = 20

@onready var start_pos:Vector2 = global_position
@onready var target_pos:Vector2 = global_position + move_direction
@onready var anim:AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	anim.play("fly")


func _physics_process(delta: float) -> void:
	global_position = global_position.move_toward(target_pos, move_speed * delta) #without the delta it would mean that we're moving 20 px per frame, with delta we're moving 20 px per second
	
	if global_position == target_pos:
		if target_pos == start_pos:
			target_pos = start_pos + move_direction
		else:
			target_pos = start_pos



#dealing damage to the player
func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return
	
	print("deal damage to the player")
	body.take_damage(1)
	
