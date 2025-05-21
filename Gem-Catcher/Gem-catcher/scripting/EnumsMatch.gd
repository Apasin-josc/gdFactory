@tool
extends EditorScript


enum Race { HOBBIT, ELF, DWARF, HUMAN, ORC, WIZARD }


func identify_race(the_race: Race) -> void:
	match the_race:
		Race.HOBBIT:
			print("Race.HOBBIT")
		Race.DWARF:
			print("Race.DWARF")
		_:
			print("Race is not what we need")
			

func _run() -> void:
	var aragorn_race: Race = Race.HUMAN
	var legolas_race: Race = Race.ELF
	var gimli_race: Race = Race.DWARF
	
	identify_race(gimli_race)
	
	
