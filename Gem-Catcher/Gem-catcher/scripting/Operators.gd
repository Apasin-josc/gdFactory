@tool
extends EditorScript

#ctrl + shift + X to run the actual script

func _run() -> void:
	print("\n---------")
	var orcs: int = 200
	var elves: int = 150
	var total_warriors: int = orcs + elves
	var orc_casualties: int = orcs - 50 
	var elves_lost: int = elves / 4.0
	var total_arrows_needed = elves * 2.0
	
	#print("Total warriors:", total_warriors)
	#print("Orcs left after battle:", orc_casualties)
	#print("Elves lost:", elves_lost)
	#print(type_string(typeof(elves_lost)))
	#print("Total arrows needed:", total_arrows_needed)
	#print(type_string(typeof(total_arrows_needed)))
	
	var gandalf_power: int = 10
	#print("Gandalf casts a super spell:", gandalf_power ** 3)
	
	var rivendell_location: Vector2 = Vector2(10, 20)
	var mordor_location: Vector2 = Vector2(50, 100)
	var are_the_same: bool = rivendell_location == mordor_location
	var different_place: bool = rivendell_location != mordor_location
	
	#print("are_the_same? ", are_the_same)
	#print("different_place? ", different_place)
	#
	#print(">= ", rivendell_location > mordor_location)
	
	var rohan_arrives := false
	var gandalf_arrives := true
	
	# or, and, not
	#print("Do the orcs win?", rohan_arrives or gandalf_arrives)
	
	var frodo_weight: float = 40.0
	var ring_weight: float = 10.0
	var sam_weight: float = 50.0
	
	print(frodo_weight * ring_weight + sam_weight)
