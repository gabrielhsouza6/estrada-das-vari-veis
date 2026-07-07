extends TabBar

@onready var grid_container: GridContainer = $HBoxContainer/ScrollContainer/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for power in Database.powers:
		var new_node = MarginContainer.new()
		new_node.custom_minimum_size.x = 50
		new_node.custom_minimum_size.y = 50
		var new_text_rect = TextureRect.new()
		var new_atlas = AtlasTexture.new()
		new_atlas.atlas = load("res://Assets/item_assets/PalisadesItemSet_0.1 x1.png")
		new_atlas.region = Rect2(16*power.get("x"), 16*power.get("y"), 16, 16)
		new_text_rect.texture = new_atlas
		new_text_rect.size_flags_horizontal = SIZE_SHRINK_CENTER
		new_text_rect.size_flags_vertical = SIZE_SHRINK_CENTER
		new_text_rect.custom_minimum_size = Vector2(36, 36)
		power.set("texture", new_atlas)
		var new_button = Button.new()
		var new_style_box = StyleBoxFlat.new()
		new_style_box.bg_color = Color(0.004, 0.004, 0.004, 0.122)
		new_style_box.corner_radius_bottom_left = 10
		new_style_box.corner_radius_top_left = 10
		new_style_box.corner_radius_bottom_right = 10
		new_style_box.corner_radius_top_right = 10
		new_style_box.corner_detail = 20
		new_button.add_theme_stylebox_override("normal", new_style_box)
		new_node.add_child(new_text_rect)
		new_node.add_child(new_button)
		new_node.set_script(load("res://scripts/store_power_panel.gd"))
		new_node.data = power
		grid_container.add_child(new_node)
