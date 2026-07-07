extends GridContainer

signal change_exhib(data: Dictionary)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_child_entered_tree(node: Node) -> void:
	node.connect("panel_clicked", _on_panel_clicked)
	print("connected")

func _on_panel_clicked(data: Dictionary) -> void:
	print("panel clicked")
	change_exhib.emit(data)
