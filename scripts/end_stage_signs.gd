extends Node

@onready var left_sign: Area2D = $Signs/left_sign
@onready var right_sign: Area2D = $Signs/right_sign
@onready var left_door: Area2D = $Doors/left_door
@onready var right_door: Area2D = $Doors/right_door
var text1: String
var text2: String
var operators = ['<', '=', '>']

func _ready() -> void:
	GameManager.connect("crystal_collected", update_end_stage)

func update_end_stage(last_number: int) -> void:
	var p = randi_range(0, 1)  ## Porta correta
	var op1 = operators[randi_range(0, 2)] ## Operador 1
	var op2 = operators[randi_range(0, 2)] ## Operador 2
	
	if p == 0:
		left_door.correct_door = true
		right_door.correct_door = false
		match op1:
			'>':
				text1 = "x > " + str(num_menor(last_number))
			'=':
				text1 = "x = " + str(last_number)
			'<':
				text1 = "x < " + str(num_maior(last_number))
		match op2:
			'>':
				text2 = "x > " + str(num_maior(last_number))
			'=':
				text2 = "x = " + str(num_menor(last_number))
			'<':
				text2 = "x < " + str(num_menor(last_number))
	else:
		left_door.correct_door = false
		right_door.correct_door = true
		match op1:
			'>':
				text1 = "x > " + str(num_maior(last_number))
			'=':
				text1 = "x = " + str(num_menor(last_number))
			'<':
				text1 = "x < " + str(num_menor(last_number))
		match op2:
			'>':
				text2 = "x > " + str(num_menor(last_number))
			'=':
				text2 = "x = " + str(last_number)
			'<':
				text2 = "x < " + str(num_maior(last_number))
	
	left_sign.set_text(text1)
	right_sign.set_text(text2)

func num_maior(num: int) -> int:
	return randi_range(num+1, 10)
	
func num_menor(num: int) -> int:
	return randi_range(-1, num-1)
