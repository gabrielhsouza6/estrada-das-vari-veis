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
	load_audio()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause") and !$"../end_stage_menu".visible:
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
	GameManager.reset_stage_status()
	get_tree().reload_current_scene()
	restart_stage.emit()

func _on_options_pressed() -> void:
	pause.visible = false
	options.visible = true
	open_options.emit()

func _on_exit_to_menu_pressed() -> void:
	get_tree().paused = false
	GameManager.reset_stage_status()
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

func load_audio() -> void:
	for child in pause.get_children():
		if child.get_class() == "Button":
			child.mouse_entered.connect(_on_hover)
			child.pressed.connect(_on_click)

func _on_hover() -> void:
	$button_audio/hover.play()

func _on_click() -> void:
	$button_audio/click.play()
