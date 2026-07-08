extends VBoxContainer

var data: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.mouse_entered.connect(_on_hover.bind($Button))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_character_exhibition(character_data: Dictionary) -> void:
	data = character_data
	$PanelContainer/Sprite2D.texture = load("res://Assets/character_assets/player/"+character_data.get("tag")+".png")
	$Label.text = character_data.get("name")
	if !character_data in Database.player_characters:
		$Button.text = str(character_data.get("price")) + " P"
		$Button.disabled = false
	else:
		$Button.text = "SOLD"
		$Button.disabled = true
	$Button.flat = false

func _on_button_pressed() -> void:
	if data.get("price") <= GameManager.total_points:
		Database.player_characters.append(data)
		$Button.text = "SOLD"
		$Button.disabled = true
		$"../../../../Audio/buy".play()
		GameManager.total_points -= data.get("price")
		GameManager.bought_character()
	else:
		$"../../../../AnimationPlayer".play("not_enough_points")

func _on_grid_container_change_exhib(data: Dictionary) -> void:
	change_character_exhibition(data)
	
func _on_hover(button: Button) -> void:
	if !button.disabled:
		$"../../../../Audio/hover".play()
