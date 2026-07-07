extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_main_menu_on_opcoes() -> void:
	visible = true

func _on_voltar_pause_pressed() -> void:
	visible = false
