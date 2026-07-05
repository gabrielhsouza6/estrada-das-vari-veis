extends Control

signal on_jogar

const GAME_SCENE := "res://scenes/stage_selection_menu.tscn"
const FONT_PATH := "res://fonts/Minecraft.ttf"
const PLAYER_PATH := "res://Assets/character_assets/player/MiniWorker.png"

var pixel_font: FontFile

func _ready() -> void:
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
	menu.add_child(jogar)

	menu.add_child(create_button("Loja"))
	menu.add_child(create_button("Opcoes"))

	var sair := create_button("Sair")
	sair.pressed.connect(_on_sair_pressed)
	menu.add_child(sair)

	# Lado esquerdo - personagem acima do texto
	#add_character(Vector2(105, 188))
	#add_shadow_text("Personagens", Vector2(28, 232), Vector2(160, 30), 17)
#
	## Lado direito - power-up acima do texto
	#add_power_icon(Vector2(438, 185))
	#add_shadow_text("Power-ups", Vector2(388, 232), Vector2(160, 30), 17)

	jogar.grab_focus()

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

#func add_character(pos: Vector2) -> void:
	#var texture := load(PLAYER_PATH)
	#if texture == null:
		#return
#
	#var sprite := Sprite2D.new()
	#sprite.texture = texture
	#sprite.position = pos
	#sprite.scale = Vector2(2.5, 2.5)
	#sprite.region_enabled = true
	#sprite.region_rect = Rect2(0, 0, 16, 16)
	#add_child(sprite)

#func add_power_icon(pos: Vector2) -> void:
	#var shadow := Label.new()
	#shadow.text = "⚡"
	#shadow.position = pos + Vector2(3, 3)
	#shadow.size = Vector2(60, 60)
	#shadow.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	#shadow.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	#shadow.add_theme_color_override("font_color", Color.BLACK)
	#shadow.add_theme_font_size_override("font_size", 42)
	#add_child(shadow)
#
	#var icon := Label.new()
	#icon.text = "⚡"
	#icon.position = pos
	#icon.size = Vector2(60, 60)
	#icon.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	#icon.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	#icon.add_theme_color_override("font_color", Color.YELLOW)
	#icon.add_theme_font_size_override("font_size", 42)
	#add_child(icon)

func _on_jogar_pressed() -> void:
	visible = false
	on_jogar.emit()
	#get_tree().change_scene_to_file(GAME_SCENE)

func _on_sair_pressed() -> void:
	get_tree().quit()
