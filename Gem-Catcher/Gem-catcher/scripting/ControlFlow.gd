@tool
extends EditorScript

func _run() -> void:
	print("\n---------")
	
	var ring_bearer: String = "Boromir"
	
	if ring_bearer == "Frodo":
		pass
	elif ring_bearer == "Boromir":
		print("You cannot wield it!")
	else:
		print("Gollum has the ring")
	
	
	var arrows: int = 10
	while arrows > 0:
		arrows -= 1
		print("Legolas shoots an arrow! Arrows left:", arrows)
	
	var fellowship: Array[String] = [
		"Frodo", "Sam", "Aragorn", 
		"Gimli", "Legolas", "Gandalf", 
		"Boromir", "Merry", "Pippin"
	]
	
	for member in fellowship:
		print(member, " joins the quest!")
		if member == "Gimli":
			break
			
	for orc in range(1, 22, 2):
		print("Orc: %d" % orc)
	
	
	
	
	
	
	
