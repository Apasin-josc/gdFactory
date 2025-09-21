extends CharacterBody2D

#creating signals for the player_underscore script
signal OnUpdateHealth(health:int)
signal OnUpdateScore(score:int)

#variables, exported to modify them inside the inspector
@export var move_speed : float = 100
@export var acceleration : float = 50
@export var braking : float = 20 
@export var gravity : float = 500
@export var jump_force : float = 200


@export var health : int = 3

var move_input : float #this is going to be a number than can be zero, if we press left -1, right 1

#creating a reference of the sprite2D to make the flip_horizontally
@onready var sprite : Sprite2D = $Sprite
@onready var anim : AnimationPlayer = $AnimationPlayer

#audio
@onready var audio : AudioStreamPlayer = $AudioStreamPlayer
var take_damage_sfx: AudioStream = preload("res://Audio/take_damage.wav")
var coin_sfx : AudioStream = preload("res://Audio/coin.wav")

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
	
	if global_position.y > 200:
		game_over()
	
	_manage_animation()

#func to play anmitaions
func _manage_animation() -> void:
	if not is_on_floor():
		anim.play("jump")
	elif move_input != 0:
		anim.play("move")
	else:
		anim.play("idle")

func take_damage(amount:int) -> void:
	health -= amount
	OnUpdateHealth.emit(health)
	_damage_flash()
	play_sound(take_damage_sfx)
	
	if health <= 0:
		call_deferred("game_over")

func game_over():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	
func increase_score(amount:int) -> void:
	PlayerStats.score += amount
	OnUpdateScore.emit(PlayerStats.score)
	play_sound(coin_sfx)

func _damage_flash() -> void:
	sprite.modulate = Color.RED
	await get_tree().create_timer(0.05).timeout
	sprite.modulate = Color.WHITE

func play_sound(sound : AudioStream) -> void:
	audio.stream = sound
	audio.play()
