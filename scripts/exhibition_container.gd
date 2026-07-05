extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.connect("panel_clicked", _on_panel_container_panel_clicked)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_panel_container_panel_clicked(character_data: Dictionary) -> void:
	$PanelContainer/Sprite2D.texture = load("res://Assets/character_assets/player/"+character_data.get("tag")+".png")
	$Label.text = character_data.get("name")
	$Label2.text = str(character_data.get("price")) + " P"
