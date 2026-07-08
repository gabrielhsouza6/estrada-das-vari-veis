extends VBoxContainer

var data: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.mouse_entered.connect(_on_hover.bind($Button))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_power_exhibition(power_data: Dictionary) -> void:
	data = power_data
	$PanelContainer/Sprite2D.texture = power_data.get("texture")
	$Label.text = power_data.get("name")
	if !power_data in Database.player_items:
		$Button.text = str(power_data.get("price")) + " P"
		$Button.disabled = false
	else:
		$Button.text = "SOLD"
		$Button.disabled = true
	$Button.flat = false
	$PanelContainer/Label.text = power_data.get("description")
		
func _on_button_pressed() -> void:
	if data.get("price") <= GameManager.total_points:
		Database.player_items.append(data)
		$Button.text = "SOLD"
		$Button.disabled = true
		$"../../../../Audio/buy".play()
		GameManager.total_points -= data.get("price")
		GameManager.bought_powerup()
	else:
		$"../../../../AnimationPlayer".play("not_enough_points")

func _on_grid_container_change_exhib(data: Dictionary) -> void:
	change_power_exhibition(data)
	
func _on_hover(button: Button) -> void:
	if !button.disabled:
		$"../../../../Audio/hover".play()
