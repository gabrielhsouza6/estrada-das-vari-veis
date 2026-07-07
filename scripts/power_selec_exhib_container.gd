extends VBoxContainer

var data: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_power_exhibition(power_data: Dictionary) -> void:
	data = power_data
	$PanelContainer/Sprite2D.texture = power_data.get("texture")
	$Label.text = power_data.get("name")
	$PanelContainer/Label.text = power_data.get("description")
	if !data in GameManager.selected_items:
		$Button.text = "Activate"
		$Button.disabled = false
	else:
		$Button.text = "Activated"
		$Button.disabled = true
		
func _on_button_pressed() -> void:
	if GameManager.selected_items.size() == 3:
		GameManager.selected_items.pop_front()
	GameManager.selected_items.append(data)
	$Button.text = "Activated"
	$Button.disabled = true

func _on_grid_container_change_exhib(data: Dictionary) -> void:
	change_power_exhibition(data)
