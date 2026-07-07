extends Node

signal took_damage(damage: int, max_health: int, current_health: int)
signal crystal_collected(number: int)
signal character_bought
signal powerup_bought
signal character_changed

var total_points:int = 50000
var stage_points:int = 0

var current_character: Dictionary = Database.characters[7]
var selected_items = []

func player_took_damage(damage: int, max_health: int, current_health: int):
	took_damage.emit(damage, max_health, current_health)

func reset_stage_status() -> void:
	stage_points = 0
	crystal_collected_emit(0)
	
func crystal_collected_emit(number: int) -> void:
	crystal_collected.emit(number)
	stage_points += number * 100
	
func bought_character() -> void:
	character_bought.emit()
	
func bought_powerup() -> void:
	powerup_bought.emit()
	
func changed_character() -> void:
	character_changed.emit()
