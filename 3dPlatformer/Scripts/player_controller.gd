extends CharacterBody3D

@export var health:int = 3

@export var move_speed:float = 3.0
@export var jump_force:float = 8.0
@export var gravity:float = 20

@onready var camera:Camera3D = $Camera3D

#this function gets called a fixed number of times per second
#function where we run all of our physics code that we want to run esentially every frame
func _physics_process(delta: float) -> void:
	#gravity
	#accelerating when we fall
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	#jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	
	#movement
	#a negative x, positive x, negative y, positive y
	var move_input:Vector2 = Input.get_vector("move_right", "move_left", "move_back", "move_forward")
	print(move_input)
	#move direction is essentially going to define the direction we want to move
	#
	var move_direction:Vector3 = Vector3(move_input.x, 0, move_input.y)
	#setting up the player velocity, *velocity* is a vector3 variable that is contained within the characterbody
	velocity.x = move_direction.x * move_speed
	velocity.z = move_direction.z * move_speed
	
	#move and slide, this is a function contained within the characterbody3d
	#this basically takes our velocity, it moves us based on that and then it does collision detection and everythin else
	move_and_slide()
	
func _process(delta:float) -> void :
	if global_position.y < -5:
		_game_over()
	
func take_damage(amount:int) -> void:
	health -= amount
	
	if health <= 0:
		_game_over()
		
func _game_over() -> void:
	get_tree().reload_current_scene()
