extends Control

@export_file("*.tscn") var game_scene_path := ""

func _ready() -> void:
	create_menu()

func create_menu() -> void:
	var bg := ColorRect.new()
	bg.color = Color(0.05, 0.07, 0.12, 1)
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(bg)

	var box := VBoxContainer.new()
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_theme_constant_override("separation", 12)
	box.set_anchors_preset(Control.PRESET_CENTER)
	box.custom_minimum_size = Vector2(360, 220)
	add_child(box)

	var title := Label.new()
	title.text = "Estrada das Variáveis"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 28)
	box.add_child(title)

	var subtitle := Label.new()
	subtitle.text = "Aprenda lógica jogando"
	subtitle.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	subtitle.add_theme_font_size_override("font_size", 12)
	box.add_child(subtitle)

	var jogar := Button.new()
	jogar.text = "Jogar"
	jogar.custom_minimum_size = Vector2(220, 36)
	jogar.pressed.connect(_on_jogar_pressed)
	box.add_child(jogar)

	var creditos := Button.new()
	creditos.text = "Créditos"
	creditos.custom_minimum_size = Vector2(220, 36)
	creditos.pressed.connect(_on_creditos_pressed)
	box.add_child(creditos)

	var sair := Button.new()
	sair.text = "Sair"
	sair.custom_minimum_size = Vector2(220, 36)
	sair.pressed.connect(_on_sair_pressed)
	box.add_child(sair)

	jogar.grab_focus()

func _on_jogar_pressed() -> void:
	if game_scene_path == "":
		push_error("Defina a cena principal do jogo no Inspector em game_scene_path.")
		return

	get_tree().change_scene_to_file(game_scene_path)

func _on_creditos_pressed() -> void:
	print("Estrada das Variáveis - Projeto Integrador")

func _on_sair_pressed() -> void:
	get_tree().quit()
