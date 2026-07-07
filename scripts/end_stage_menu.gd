extends Control

@onready var score: Label = $MarginContainer/VBoxContainer/score_vbox/score
@onready var best_score: Label = $MarginContainer/VBoxContainer/best_score_vbox/best_score
@onready var gained_points: Label = $MarginContainer/VBoxContainer/gained_points_vbox/gained_points

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect("stage_finished", show_menu)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_next_stage_pressed() -> void:
	visible = false
	get_tree().paused = false
	
	var current_stage_id = GameManager.current_stage.get("id")
	var current_stage_world = GameManager.current_stage.get("world")
	var next_stage_world: int
	var next_stage_id: int
	
	if current_stage_id == 5:
		next_stage_id = 1
		next_stage_world = current_stage_world + 1
	else:
		next_stage_id = current_stage_world + 1
		next_stage_world = current_stage_world
	GameManager.reset_stage_status()
	get_tree().change_scene_to_file("res://scenes/stage_" + str(next_stage_id) + "_" + str(next_stage_world) + ".tscn")
	
func _on_try_again_pressed() -> void:
	visible = false
	get_tree().paused = false
	GameManager.reset_stage_status()
	get_tree().reload_current_scene()

func _on_exit_menu_pressed() -> void:
	get_tree().paused = false
	GameManager.reset_stage_status()
	get_tree().change_scene_to_file("res://scenes/main_menu_scene.tscn")
	
func load_and_show() -> void:
	visible = true
	get_tree().paused = true
	
	var data = GameManager.current_stage
	score.text = str(GameManager.stage_points) + " P"
	best_score.text = str(data.get("score")) + " P"
	if GameManager.stage_points >= data.get("score"):
		gained_points.text = str(GameManager.stage_points - data.get("score")) + " P"
	else:
		gained_points.text = "0 P"
	$AnimationPlayer.play("show_menu")

func show_menu() -> void:
	$Timer.start(.75)

func _on_timer_timeout() -> void:
	load_and_show()
