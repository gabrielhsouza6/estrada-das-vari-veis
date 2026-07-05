extends MarginContainer

signal panel_clicked(character_data: Dictionary)

@export var data = {
	"name": "Noble Woman",
	"tag": "MiniNobleWoman",
	"price": 12000
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = get_child(1)
	button.connect("pressed", change_exhibition)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func change_exhibition() -> void:
	print("change exhibition")
	GameManager.store_panel_clicked(data)
