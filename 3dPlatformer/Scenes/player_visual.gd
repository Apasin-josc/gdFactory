extends MeshInstance3D

@export var rotate_rate:float = 20.0
var target_y_rot:float = 0

@onready var player:CharacterBody3D = get_parent() #it's going to get the player NODE (parent)

func _process(delta: float) -> void:
	_smooth_rotation(delta)
	_move_bob(delta)
	
func _smooth_rotation(delta:float) -> void:
	var vel = player.velocity
	
	#when the player is running
	if vel.x != 0 or vel.z != 0:
		#converting a direction into an angle
		target_y_rot = atan2(vel.x, vel.z)
	
	rotation.y = lerp_angle(rotation.y, target_y_rot, rotate_rate * delta)

func _move_bob(delta:float) -> void:
	#making the player bounce up and down
	var move_speed = player.velocity.length()
	
	if move_speed < 0.1 or not player.is_on_floor():
		scale.y = 1
		return
	
	#using a sin wave to return a value on a given time
	var time = Time.get_unix_time_from_system()
	#instead of -1 to 1
	var y_scale = 1 + (sin(time * 30) * 0.08)
	scale.y = y_scale
	
