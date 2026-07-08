extends Control

signal on_jogar
signal on_loja
signal on_personagens
signal on_powerups
signal on_opcoes

@onready var characters_button: Button = $characters_button
@onready var power_button: Button = $power_button


const GAME_SCENE := "res://scenes/stage_selection_menu.tscn"
const FONT_PATH := "res://fonts/Minecraft.ttf"
const PLAYER_PATH := "res://Assets/character_assets/player/MiniWorker.png"

var pixel_font: FontFile

func _ready() -> void:
	GameManager.connect("character_changed", update_character)
	pixel_font = load(FONT_PATH)
	create_menu()

func create_menu() -> void:
	#var bg := ColorRect.new()
	#bg.color = Color(0.045, 0.04, 0.09, 1)
	#bg.size = Vector2(576, 324)
	#add_child(bg)

	# Título bem enquadrado no topo
	add_shadow_text("Estrada\ndas\nVariaveis", Vector2(168, 8), Vector2(240, 98), 31)

	# Menu central abaixo do título
	var menu := VBoxContainer.new()
	menu.position = Vector2(218, 118)
	menu.size = Vector2(140, 112)
	menu.add_theme_constant_override("separation", 5)
	add_child(menu)

	var jogar := create_button("Jogar")
	jogar.pressed.connect(_on_jogar_pressed)
	jogar.mouse_entered.connect(_on_hover)
	jogar.pressed.connect(_on_click)
	menu.add_child(jogar)
	
	var loja := create_button("Loja")
	loja.pressed.connect(_on_loja_pressed)
	loja.mouse_entered.connect(_on_hover)
	loja.pressed.connect(_on_click)
	menu.add_child(loja)
	
	var opcoes:= create_button("Opcoes")
	opcoes.pressed.connect(_on_opcoes_pressed)
	opcoes.mouse_entered.connect(_on_hover)
	opcoes.pressed.connect(_on_click)
	menu.add_child(opcoes)
	

	var sair := create_button("Sair")
	sair.pressed.connect(_on_sair_pressed)
	sair.mouse_entered.connect(_on_hover)
	sair.pressed.connect(_on_click)
	menu.add_child(sair)
	
	update_character()
	
	
	characters_button.mouse_entered.connect(_on_hover)
	characters_button.pressed.connect(_on_click)
	power_button.mouse_entered.connect(_on_hover)
	power_button.pressed.connect(_on_click)


func add_shadow_text(texto: String, pos: Vector2, size: Vector2, font_size: int) -> void:
	var shadow := Label.new()
	shadow.text = texto
	shadow.position = pos + Vector2(3, 3)
	shadow.size = size
	shadow.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	shadow.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	shadow.add_theme_color_override("font_color", Color.BLACK)
	shadow.add_theme_font_override("font", pixel_font)
	shadow.add_theme_font_size_override("font_size", font_size)
	add_child(shadow)

	var label := Label.new()
	label.text = texto
	label.position = pos
	label.size = size
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.add_theme_color_override("font_color", Color.WHITE)
	label.add_theme_font_override("font", pixel_font)
	label.add_theme_font_size_override("font_size", font_size)
	add_child(label)

func create_button(texto: String) -> Button:
	var b := Button.new()
	b.text = texto
	b.flat = false
	b.custom_minimum_size = Vector2(140, 23)
	b.add_theme_font_override("font", pixel_font)
	b.add_theme_font_size_override("font_size", 17)
	return b
	
func _on_click() -> void:
	$Audio/click.play()

func _on_hover() -> void:
	$Audio/hover.play()

func update_character() -> void:
	$character_sprite.texture = load("res://Assets/character_assets/player/" + GameManager.current_character.get("tag") + ".png")

func _on_jogar_pressed() -> void:
	visible = false
	on_jogar.emit()
	#get_tree().change_scene_to_file(GAME_SCENE)

func _on_sair_pressed() -> void:
	get_tree().quit()
	
func _on_loja_pressed() -> void:
	visible = false
	on_loja.emit()
	
func _on_opcoes_pressed() -> void:
	visible = false
	on_opcoes.emit()

func _on_store_menu_exited_loja() -> void:
	visible = true

func _on_characters_button_pressed() -> void:
	visible = false
	on_personagens.emit()
	
func _on_power_button_pressed() -> void:
	visible = false
	on_powerups.emit()

func _on_characters_menu_exit_characters() -> void:
	visible = true

func _on_powerups_menu_exit_powerups() -> void:
	visible = true
	
func _on_voltar_opcoes_pressed() -> void:
	visible = true

func _on_stage_selection_menu_exit_stages() -> void:
	visible = true
