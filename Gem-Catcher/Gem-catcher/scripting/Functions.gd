@tool
extends EditorScript


func summon_gandalf() -> void:
	print("A bright light appears! Gandalf has arrived!")	


func attack_enemy(enemy: String, damage: int = 100) -> void:
	print("You attack %s for %d damage" % [enemy, damage])


func get_player_health() -> int:
	return 200


func _run() -> void:
	print("\n---------")
	attack_enemy("Orc", 25)
	attack_enemy("Troll", 50)
	attack_enemy("Urak-Hai")
	summon_gandalf()
	var player_health: int = get_player_health()
	print(player_health)
