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
	if data != GameManager.current_character:
		$Button.text = "Change"
		$Button.disabled = false
	else:
		$Button.text = "Selected"
		$Button.disabled = true

func _on_button_pressed() -> void:
	GameManager.current_character = data
	$Button.text = "Selected"
	$Button.disabled = true
	GameManager.changed_character()
	$"../../../Audio/change".play()

func _on_grid_container_change_exhib(data: Dictionary) -> void:
	change_character_exhibition(data)
	
func _on_hover(button: Button) -> void:
	if !button.disabled:
		$"../../../Audio/hover".play()
