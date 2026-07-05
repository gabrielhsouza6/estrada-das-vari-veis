extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#connect("stage_clicked", load_stage)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func load_stage(stage_name: String) -> void:
	get_tree().change_scene_to_file("res://scenes/"+stage_name+".tscn")
	print("Stage loaded: " + stage_name)
	

func _on_stage_clicked(stage_name: String) -> void:
	print("Stage loaded: " + stage_name)
	get_tree().change_scene_to_file("res://scenes/"+stage_name+".tscn")

func _on_main_menu_on_jogar() -> void:
	visible = true
