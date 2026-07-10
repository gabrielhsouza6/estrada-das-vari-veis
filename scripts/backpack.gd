extends Control

var backpack_open: bool = false

func _ready() -> void:
	GameManager.connect("crystal_collected", update_label)

func _on_button_pressed() -> void:
	if backpack_open:
		$AnimationPlayer.play("close_backpack")
		backpack_open = false
	else:
		$AnimationPlayer.play("open_backpack")
		backpack_open = true
	
func update_label(number: int) -> void:
	$Label.text = str(number)
	
