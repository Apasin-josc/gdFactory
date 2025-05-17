@tool
extends EditorScript

#ctrl + shift + X to run the actual script

func _run() -> void:
	var gandalf: String = "Gandalf"
	var legolas: String = "Legolas"
	var gandalf_race: String = "Wizard"
	var legolas_race: String = "Elf"
	var gandalf_weapon: String = "Staff"
	var legolas_weapon: String = "Bow"
	
	var gandalf_string: String = "%s %s %s" % [
		gandalf, gandalf_race, gandalf_weapon
	]
	
	var legolas_string: String = "%s %s %s" % [
		legolas, legolas_race, legolas_weapon
	]
	print(gandalf_string)
	print(legolas_string)
	
