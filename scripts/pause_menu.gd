extends Control

signal resume_game
signal restart_stage
signal open_options
signal exit_to_menu

@onready var pause: VBoxContainer = $PanelContainer/pause
@onready var options: VBoxContainer = $PanelContainer/options
@onready var voltar_pause: Button = $PanelContainer/options/voltar_pause


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	voltar_pause.pressed.connect(_on_voltar_pause_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			visible = false
			get_tree().paused = false
		else:
			visible = true
			get_tree().paused = true
			

func _on_resume_pressed() -> void:
	visible = false
	get_tree().paused = false
	resume_game.emit()

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	GameManager.reset_stage_status()
	restart_stage.emit()

func _on_options_pressed() -> void:
	pause.visible = false
	options.visible = true
	open_options.emit()

func _on_exit_to_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu_scene.tscn")
	exit_to_menu.emit()

func _on_voltar_pause_pressed() -> void:
	pause.visible = true
	options.visible = false

func _on_fullscreen_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
