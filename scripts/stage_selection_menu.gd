extends Control

signal exit_stages

var unlocked = true

@onready var tab_container: TabContainer = $TabContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for tab in tab_container.get_children():
		for stage in Database.stages:
			if int(tab.name) == stage.get("world"):
				var stage_list = tab.get_child(0).get_child(0)
				var new_node = $stage_panel.duplicate(15)
				new_node.visible = true
				new_node.data = stage
				var button : Button = new_node.get_child(0)
				var score_label : Label = new_node.get_child(1)
				button.text = str(stage.get("id"))
				button.mouse_entered.connect(_on_hover.bind(button))
				if unlocked:
					score_label.text = "Recorde " + str(stage.get("score"))
				else:
					score_label.text = ""
					button.disabled = true
				if stage.get("finished") == false:
					unlocked = false
				stage_list.add_child(new_node)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_main_menu_on_jogar() -> void:
	visible = true

func _on_exit_pressed() -> void:
	visible = false
	exit_stages.emit()
	
func _on_hover(button: Button) -> void:
	if !button.disabled:	
		$Audio/hover.play()
