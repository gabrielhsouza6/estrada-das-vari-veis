extends TabBar

@onready var grid_container: GridContainer = $HBoxContainer/ScrollContainer/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for character in Database.characters:
		var new_node = MarginContainer.new()
		new_node.custom_minimum_size.x = 50
		new_node.custom_minimum_size.y = 50
		var new_text_rect = TextureRect.new()
		var new_atlas = AtlasTexture.new()
		new_atlas.atlas = load("res://Assets/character_assets/player/"+character.get("tag")+".png")
		new_atlas.region = Rect2(6, 47, 20, 19)
		new_text_rect.texture = new_atlas
		var new_button = Button.new()
		var new_style_box = StyleBoxFlat.new()
		new_style_box.bg_color = Color(0.004, 0.004, 0.004, 0.122)
		new_style_box.corner_radius_bottom_left = 10
		new_style_box.corner_radius_top_left = 10
		new_style_box.corner_radius_bottom_right = 10
		new_style_box.corner_radius_top_right = 10
		new_style_box.corner_detail = 20
		new_button.add_theme_stylebox_override("normal", new_style_box)
		new_button.mouse_entered.connect(_on_hover)
		new_node.add_child(new_text_rect)
		new_node.add_child(new_button)
		new_node.set_script(load("res://scripts/store_character_panel.gd"))
		new_node.data = character
		grid_container.add_child(new_node)

func _on_hover() -> void:
	$"../../Audio/hover".play()
