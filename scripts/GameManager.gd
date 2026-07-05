extends Node

signal took_damage(damage: int, max_health: int, current_health: int)
signal crystal_collected(number: int)
signal  panel_clicked(data: Dictionary)

var total_points:int
var stage_points:int = 0

func player_took_damage(damage: int, max_health: int, current_health: int):
	took_damage.emit(damage, max_health, current_health)

func reset_stage_status() -> void:
	stage_points = 0
	crystal_collected_emit(0)
	
func crystal_collected_emit(number: int) -> void:
	crystal_collected.emit(number)
	stage_points += number * 100
	
func store_panel_clicked(data: Dictionary) -> void:
	panel_clicked.emit(data)
