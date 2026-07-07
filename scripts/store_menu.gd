extends Control

signal exited_loja

func _process(delta: float) -> void:
	$points_label.text = "Your Points: " + str(GameManager.total_points) + " P"

func _on_exit_pressed() -> void:
	visible = false
	exited_loja.emit()
	
func _on_loja_pressed() -> void:
	visible = true
