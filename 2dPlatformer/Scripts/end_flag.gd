extends Area2D

@export var scene_to_load:PackedScene

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return
	
	call_deferred("level_passed")

func level_passed() -> void:
	get_tree().change_scene_to_packed(scene_to_load)
