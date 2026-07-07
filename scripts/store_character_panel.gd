extends MarginContainer

signal panel_clicked(data: Dictionary)

@export var data : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = get_child(1)
	button.connect("pressed", clicked)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func clicked() -> void:
	print("change exhibition")
	panel_clicked.emit(data)
