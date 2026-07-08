extends Node

@onready var left_sign: Area2D = $Signs/left_sign
@onready var right_sign: Area2D = $Signs/right_sign
@onready var left_door: Area2D = $Doors/left_door
@onready var right_door: Area2D = $Doors/right_door
@onready var crystals: Node = $Crystals

var text1: String
var text2: String

func _ready() -> void:
	GameManager.connect("crystal_collected", update_end_stage)
	load_crystal_data()
	
func update_end_stage(number: int) -> void:
	var p = randi_range(0, 1)  ## Porta correta
	var last_logic
	if number == 10:
		last_logic = "V"
	else:
		last_logic = "F"
	if p == 0:
		left_door.correct_door = true
		right_door.correct_door = false
		match last_logic:
			"F":
				text1 = "O OR V"
				if randi_range(0, 1) == 0:
					text2 = "O OR F"
				else:
					text2 = "O AND " + rand_logic()
			"V":
				text2 = "O AND F"
				if randi_range(0, 1) == 0:
					text1 = "O OR " + rand_logic()
				else:
					text1 = "O AND V"
	else:
		left_door.correct_door = false
		right_door.correct_door = true
		match last_logic:
			"F":
				text2 = "O OR V"
				if randi_range(0, 1) == 0:
					text1 = "O OR F"
				else:
					text1 = "O AND " + rand_logic()
			"V":
				text1 = "O AND F"
				if randi_range(0, 1) == 0:
					text2 = "O OR " + rand_logic()
				else:
					text2 = "O AND V"
	
	left_sign.set_text(text1)
	right_sign.set_text(text2)
	
func inv_logic(logic: String) -> String:
	if logic == "V":
		return "F"
	else:
		return "V"
		
func rand_logic() -> String:
	if randi_range(0, 1) == 0:
		return "F"
	else:
		return "V"
	
func load_crystal_data() -> void:
	for crystal in crystals.get_children():
		if randi_range(0, 1) == 0:
			crystal.logic = "V"
			crystal.color = "blue"
		else:
			crystal.logic = "F"
			crystal.color = "red"
	GameManager.update_crystal_data()
