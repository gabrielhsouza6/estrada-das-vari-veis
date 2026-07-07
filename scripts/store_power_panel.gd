extends MarginContainer

signal panel_clicked(data: Dictionary)

@export var data : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = get_child(1)
	button.connect("pressed", clicked)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var button : Button = get_child(1)
	var new_style_box = StyleBoxFlat.new()
	new_style_box.bg_color = Color(0.004, 0.004, 0.004, 0.122)
	new_style_box.corner_radius_bottom_left = 10
	new_style_box.corner_radius_top_left = 10
	new_style_box.corner_radius_bottom_right = 10
	new_style_box.corner_radius_top_right = 10
	new_style_box.corner_detail = 20
	if data in GameManager.selected_items:
		new_style_box.set_border_width_all(2)
		new_style_box.border_color = Color.WHITE
		button.add_theme_stylebox_override("normal", new_style_box)
	else:
		button.add_theme_stylebox_override("normal", new_style_box)
	
func clicked() -> void:
	print("change exhibition")
	panel_clicked.emit(data)
