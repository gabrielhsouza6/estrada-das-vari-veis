extends Node

signal took_damage(damage: int, max_health: int, current_health: int)
signal crystal_collected(number: int)
signal character_bought
signal powerup_bought
signal character_changed
signal stage_finished

var save_path = "user://user_data.save"
var total_points: int = 75000
var stage_points: int = 0
var current_character: Dictionary = Database.characters[7]
var current_stage: Dictionary
var selected_items = []

func _ready() -> void:
	#load_data()
	pass

func player_took_damage(damage: int, max_health: int, current_health: int):
	took_damage.emit(damage, max_health, current_health)

func reset_stage_status() -> void:
	stage_points = 0
	crystal_collected_emit(0)
	
func crystal_collected_emit(number: int) -> void:
	crystal_collected.emit(number)
	stage_points += number * 100
	
func bought_character() -> void:
	#save_data()
	character_bought.emit()
	
func bought_powerup() -> void:
	#save_data()
	powerup_bought.emit()
	
func changed_character() -> void:
	#save_data()
	character_changed.emit()
	
func finished_stage() -> void:
	stage_finished.emit()
	update_stage_data()
	#save_data()
	
func update_stage_data() -> void:
	for stage in Database.stages:
		if stage == current_stage:
			stage.set("finished", true)
			
			if stage.score < stage_points:
				total_points += (stage_points - stage.score)
				stage.set("score", stage_points)
				
func save_data() -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Database.player_characters)
	file.store_var(Database.player_items)
	file.store_var(Database.stages)
	file.store_var(GameManager.current_character)
	file.store_var(GameManager.total_points)
	file.close()
	
func load_data() -> void:
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Database.player_characters = file.get_var()
		Database.player_items = file.get_var()
		Database.stages = file.get_var()
		GameManager.current_character = file.get_var()
		GameManager.total_points = file.get_var()
		file.close()

	
