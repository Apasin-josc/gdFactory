extends Sprite2D

var speed : float = 100.0

func _ready() -> void:
	print(position)


func _process(delta: float) -> void:
	var direction = Vector2(1,1)
	position += direction * speed * delta
