extends VBoxContainer

@export var data : Dictionary

@onready var button: Button = $Button
@onready var score_label: Label = $score_label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(_load_stage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _load_stage() -> void:
	print("loadind stage: " + data.get("tag"))
	get_tree().change_scene_to_file("res://scenes/" + data.get("tag") + ".tscn")
