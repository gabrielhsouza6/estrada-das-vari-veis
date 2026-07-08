extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(_on_hover)
	pressed.connect(_on_click)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_hovered():
		scale = Vector2(1.8, 1.8)
	else:
		scale = Vector2(1.5, 1.5)
		
func _on_hover() -> void:
	$"../Audio/hover".play()

func _on_click() -> void:
	$"../Audio/exit".play()
