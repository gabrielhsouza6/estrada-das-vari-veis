extends Control

@onready var score: Label = $MarginContainer/VBoxContainer/score_vbox/score
@onready var best_score: Label = $MarginContainer/VBoxContainer/best_score_vbox/best_score
@onready var gained_points: Label = $MarginContainer/VBoxContainer/gained_points_vbox/gained_points
@onready var buttons_vbox: VBoxContainer = $MarginContainer/VBoxContainer/buttons_vbox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect("item_gained", _on_item_gained)
	GameManager.connect("stage_finished", show_menu)
	load_audio()

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
		next_stage_id = current_stage_id + 1
		next_stage_world = current_stage_world
	GameManager.reset_stage_status()
	GameManager.current_stage = GameManager.get_stage(next_stage_id, next_stage_world)
	get_tree().change_scene_to_file("res://scenes/stages/stage_" + str(next_stage_id) + "_" + str(next_stage_world) + ".tscn")
	
func _on_try_again_pressed() -> void:
	visible = false
	get_tree().paused = false
	GameManager.reset_stage_status()
	get_tree().reload_current_scene()

func _on_exit_menu_pressed() -> void:
	get_tree().paused = false
	GameManager.reset_stage_status()
	get_tree().change_scene_to_file("res://scenes/main_menu_scene.tscn")
	
func load_data() -> void:
	var data = GameManager.current_stage
	score.text = str(GameManager.stage_points) + " P"
	best_score.text = str(data.get("score")) + " P"
	if GameManager.stage_points >= data.get("score"):
		gained_points.text = str(GameManager.stage_points - data.get("score")) + " P"
	else:
		gained_points.text = "0 P"

func show_menu() -> void:
	$Timer.start(.75)
	load_data()

func _on_timer_timeout() -> void:
	visible = true
	get_tree().paused = true
	$AnimationPlayer.play("show_menu")
	
func load_audio() -> void:
	$new_item_container/VBoxContainer/continue.pressed.connect(_on_click)
	$new_item_container/VBoxContainer/continue.mouse_entered.connect(_on_hover)
	for button in buttons_vbox.get_children():
		button.mouse_entered.connect(_on_hover)
		button.pressed.connect(_on_click)

func _on_hover() -> void:
	$button_audio/hover.play()

func _on_click() -> void:
	$button_audio/click.play()

func _on_item_gained() -> void:
	show_menu()
	$MarginContainer.visible = false
	$new_item_container.visible = true
	
func _on_continue_pressed() -> void:
	$MarginContainer.visible = true
	$new_item_container.visible = false
