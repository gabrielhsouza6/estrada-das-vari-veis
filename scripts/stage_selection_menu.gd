extends Control

signal exit_stages

var unlocked = true

@onready var tab_container: TabContainer = $TabContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for tab in tab_container.get_children():
		for stage in Database.stages:
			if int(tab.name) == stage.get("world"):
				var stage_list = tab.get_child(0).get_child(0)
				var new_node = $stage_panel.duplicate(15)
				new_node.visible = true
				#var new_node = VBoxContainer.new()
				#new_node.size = Vector2(50, 81)
				#var new_button = Button.new()
				#new_button.alignment = HORIZONTAL_ALIGNMENT_CENTER
				#var new_style_box = StyleBoxFlat.new()
				##new_style_box.bg_color = Color.from_rgba8()
				#new_style_box.corner_radius_top_right = 20
				#new_style_box.corner_radius_top_left = 20
				#new_style_box.corner_radius_bottom_right = 20
				#new_style_box.corner_radius_bottom_left = 20
				#new_style_box.content_margin_top = 5
				#new_style_box.content_margin_bottom = -1
				#new_button.add_theme_stylebox_override("normal", new_style_box)
				#new_style_box.bg_color = Color.from_rgba8(0.22, 0.22, 0.22, 0.60)
				#new_button.add_theme_stylebox_override("hover", new_style_box)
				##var new_theme = Theme.new()
				##new_theme.set_font("default", "default", load("res://fonts/Minecraft.ttf"))
				##new_theme.set_font_size("default", "default", 26)
				#new_button.add_theme_font_override("default1", load("res://fonts/Minecraft.ttf"))
				#new_button.add_theme_font_size_override("default1", 26)
				#var new_label = Label.new()
				#new_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
				#new_label.vertical_alignment = VERTICAL_ALIGNMENT_TOP
				#new_label.autowrap_mode = TextServer.AUTOWRAP_WORD
				#new_label.add_theme_font_override("default", load("res://fonts/Minecraft.ttf"))
				#new_label.add_theme_font_size_override("default", 11)
				#new_button.text = stage.get("id")
				#new_label.text = "Recorde " + str(stage.get("score"))
				#new_node.add_child(new_button)
				#new_node.add_child(new_label)
				#new_node.set_script(load("res://scripts/stage_panel.gd"))
				new_node.data = stage
				var button : Button = new_node.get_child(0)
				var score_label : Label = new_node.get_child(1)
				button.text = str(stage.get("id"))
				if unlocked:
					score_label.text = "Recorde " + str(stage.get("score"))
				else:
					score_label.text = ""
					button.disabled = true
				if stage.get("finished") == false:
					unlocked = false
				stage_list.add_child(new_node)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_main_menu_on_jogar() -> void:
	visible = true

func _on_exit_pressed() -> void:
	visible = false
	exit_stages.emit()
