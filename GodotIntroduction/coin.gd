extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.scale.x += 0.2  #increasing the player scale whenever the player touch a coin
	body.scale.y += 0.2
	queue_free() #destroys the node which the script is attach to
