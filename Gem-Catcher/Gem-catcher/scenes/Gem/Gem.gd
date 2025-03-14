extends Area2D

#type name :)
class_name Gem

@onready var sprite_2d: Sprite2D = $Sprite2D

#custom signal 🫵
signal gem_off_screen

const SPEED: float = 200.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += SPEED * delta
	
	if position.y > get_viewport_rect().end.y:
		print("Gem Falls OFF 😢")
		#EMITING THE SIGNAL BRO
		gem_off_screen.emit()
		die()
		

func die() -> void:
	set_process(false) #stopping the engine invoking the process of this scene
	queue_free() #it's going to remove the gem scene from the game scene

func _on_area_entered(area: Area2D) -> void:
	print("Gem hits paddle")
	die()
