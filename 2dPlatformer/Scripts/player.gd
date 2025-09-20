extends CharacterBody2D

#variables, exported to modify them inside the inspector
@export var move_speed : float = 100
@export var acceleration : float = 50
@export var braking : float = 20 
@export var gravity : float = 500
@export var jump_force : float = 200

var move_input : float #this is going to be a number than can be zero, if we press left -1, right 1

#creating a reference of the sprite2D to make the flip_horizontally
@onready var sprite : Sprite2D = $Sprite
@onready var anim : AnimationPlayer = $AnimationPlayer


#this is a function that gets called independent from the frame rate, process just run on the fps
func _physics_process(delta: float) -> void:
	#gravity
	if not is_on_floor():
		velocity.y += gravity * delta  #delta is the time between frames so this just make it we're increasing our y vvelocity by gravity per second
	
	#Input.get_axis needs a negative or a value (move_input), gets the move input
	move_input = Input.get_axis("move_left", "move_right")
	
	#managed by the characterbody2D node
	#velocity.x = move_input * move_speed
	#movement
	if move_input != 0:
		#applying acceleration
		velocity.x = lerp(velocity.x, move_input * move_speed, acceleration * delta)
	else:
		#braking
		velocity.x = lerp(velocity.x, 0.0, braking * delta)
	
	#jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	#moves the character body on (velocity)
	move_and_slide()

#for animations
func _process(delta:float) -> void:
	#to turn to the right and to avoid returning to the original sprite position by only fliping the sprite if we are moving
	if velocity.x != 0:
		sprite.flip_h = velocity.x > 0
	
	_manage_animation()

#func to play anmitaions
func _manage_animation() -> void:
	if not is_on_floor():
		anim.play("jump")
	elif move_input != 0:
		anim.play("move")
	else:
		anim.play("idle")
