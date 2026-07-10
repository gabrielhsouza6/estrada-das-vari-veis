extends Control

var blue_texture = load("res://Assets/gui_assets/orb/orb_1.png")
var red_texture = load("res://Assets/gui_assets/orb/orb_2.png")
var shown: bool = false

func _ready() -> void:
	GameManager.connect("crystal_collected", update_label)

func _on_button_pressed() -> void:
	if shown:
		$AnimationPlayer.play("hide_orb")
		shown = false
	else:
		$AnimationPlayer.play("show_orb")
		shown = true
	
func update_label(number: int) -> void:
	if number == 10:
		$Label.text = "V"
		$Sprite2D.texture = blue_texture
	elif number == 0:
		$Label.text = "F"
		$Sprite2D.texture = red_texture
