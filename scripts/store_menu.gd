extends Control

signal exited_loja
@onready var exit: Button = $Exit

func _process(delta: float) -> void:
	if exit.is_hovered():
		exit.scale = Vector2(1.8, 1.8)
	else:
		exit.scale = Vector2(1.5, 1.5)
	$points_label.text = "Your Points: " + str(GameManager.total_points) + " P"

func _on_exit_pressed() -> void:
	visible = false
	exited_loja.emit()
	
func _on_loja_pressed() -> void:
	visible = true
