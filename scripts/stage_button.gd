extends Button

signal stage_clicked(stage_name: String)

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	print("Stage clicked: " + $".".name)
	stage_clicked.emit($".".name)
