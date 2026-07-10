extends Node2D

signal reset_crystal

var player_health = 3
var points = 0
var answer: int
var ops = ['<', '=', '>']
var colors = ["blue", "red", "green", "pink", "purple"]
@onready var expression: Label = $CanvasLayer/decision_screen/MarginContainer/VBoxContainer/expression
@onready var crystal: Area2D = $Crystal/Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect("crystal_collected", decide)
	create_decision()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func create_decision() -> void:
	var crystal_number = randi_range(0, 10)
	answer = randi_range(0, 1)
	var text_expression: String
	
	if crystal_number == 0 or crystal_number == 10:
		if answer:
			match crystal_number:
				0:
					text_expression = "O OR V"
				10:
					if randi_range(0, 1) == 0:
						text_expression = "O OR " + rand_logic()
					else:
						text_expression = "O AND V"
		else:
			match crystal_number:
				0:
					if randi_range(0, 1) == 0:
						text_expression = "O OR F"
					else:
						text_expression = "O AND " + rand_logic()
				10:
					text_expression = "O AND F"
	else:
		var op = ops[randi_range(0, 2)]
		if answer:
			match op:
				'>':
					text_expression = "x > " + str(num_menor(crystal_number))
				'=':
					text_expression = "x = " + str(crystal_number)
				'<':
					text_expression = "x < " + str(num_maior(crystal_number))
		else:
			match op:
				'>':
					text_expression = "x > " + str(num_maior(crystal_number))
				'=':
					text_expression = "x = " + str(num_menor(crystal_number))
				'<':
					text_expression = "x < " + str(num_menor(crystal_number))
		
	expression.text = text_expression
	crystal.number = crystal_number
	crystal.color = colors[randi_range(0, 4)]
	GameManager.update_crystal_data()
	reset_crystal.emit()
	
func decide(number: int) -> void:
	$Timer.start(.5)
	
func _on_timer_timeout() -> void:
	if player_health == 0:
		get_tree().reload_current_scene()
	else:
		show_decision()
	
func show_decision() -> void:
	Engine.time_scale = .05
	$CanvasLayer/decision_screen.visible = true

func _on_true_button_pressed() -> void:
	if answer:
		points+=1
		$Audio/correct.play()
		if points == 5:
			$AnimationPlayer.play("win_stage")
	else:
		player_health -=1
		if player_health == 0:
			$player/AnimationPlayer.play("dead")
			$AnimationPlayer.play("losing_stage")
			$Timer.start(4)
		else:
			$player/AnimationPlayer.play("wrong")
	hide_decision()

func _on_false_button_pressed() -> void:
	if !answer:
		points+=1
		$Audio/correct.play()
		if points == 5:
			$AnimationPlayer.play("win_stage")
	else:
		player_health-=1
		if player_health == 0:
			$player/AnimationPlayer.play("dead")
			$AnimationPlayer.play("losing_stage")
			$Timer.start(4)
		else:
			$player/AnimationPlayer.play("wrong")
	hide_decision()
	
func hide_decision() -> void:
	$CanvasLayer/decision_screen.visible = false
	Engine.time_scale = 1
	
func end_stage() -> void:
	get_tree().change_scene_to_file("res://scenes/end_game_scene.tscn")
	
func rand_logic() -> String:
	if randi_range(0, 1) == 0:
		return "F"
	else:
		return "V"
		
func num_maior(num: int) -> int:
	return randi_range(num+1, 10)
	
func num_menor(num: int) -> int:
	return randi_range(0, num-1)
	
func move_background() -> void:
	$Timer2.start(0.015)
	
func _on_timer_2_timeout() -> void:
	$background.position.x -= 1
	$floor_walls.position.x -= 1
