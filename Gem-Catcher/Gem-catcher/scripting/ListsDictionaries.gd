@tool
extends EditorScript

func _run() -> void:
	print("\n---------")
	
	var rings_of_power: Array[String] = ["Elves", "Dwarves", "Men"]
	
	rings_of_power.append("Hobbits")	
	rings_of_power.append("Orcs")	
	rings_of_power.append("Wizards")	
	print(rings_of_power)
	#rings_of_power.erase("Elves")	
	#print(rings_of_power)
	var random_ring: String = rings_of_power.pick_random()
	print(random_ring)
	
	rings_of_power.shuffle()
	print(rings_of_power)
	
	print(rings_of_power.size())
	
	var levels: Dictionary[int, String] = {
		1: "Wooden sword",
		2: "Iron sword",
		3: "Steel sword",
		4: "Elven blade",
		5: "Dwarven axe",
		6: "Mithril armor",
		7: "Andúril, Flame of the West",
		8: "Bow of Galadriel",
		9: "Ring of Power",
		10: "The One Ring (corrupts the user!)"
	}

	for level in levels:
		print("Level %d -> %s" % [level, levels[level]])
	
	for level_name in levels.values():
		print(level_name)

	levels[4] = "Elven Bow"	
	print(levels)

	levels[11] = "Mithril shield"
	print(levels)
	
	levels.erase(6)
	print(levels)
	
	
	var fellowship: Dictionary[String, Dictionary] = {
		"Frodo": {"race": "Hobbit", "weapon": "Sting"},
		"Sam": {"race": "Hobbit", "weapon": "Cooking Pan"},
		"Gandalf": {"race": "Wizard", "weapon": "Glamdring"},
		"Aragorn": {"race": "Human", "weapon": "Andúril"},
		"Legolas": {"race": "Elf", "weapon": "Bow and Daggers"},
		"Gimli": {"race": "Dwarf", "weapon": "Battle Axe"},
		"Boromir": {"race": "Human", "weapon": "Shield and Sword"},
		"Merry": {"race": "Hobbit", "weapon": "Dagger"},
		"Pippin": {"race": "Hobbit", "weapon": "Dagger"}
	}
	
	var aw: String = fellowship["Aragorn"]["weapon"]
	
	for fellow in fellowship:
		#if fellow == "Sam" or fellow == "Gimli":
		if fellow in ["Sam", "Gimli"]:
			var data = fellowship[fellow]
			print(data.race)
