extends Node

signal took_damage(damage: int, max_health: int, current_health: int)

func player_took_damage(damage: int, max_health: int, current_health: int):
	took_damage.emit(damage, max_health, current_health)
