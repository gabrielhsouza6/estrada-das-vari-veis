extends Area2D

@export var number: int
@export var color: String
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $Label
var disabled : bool



func _on_body_entered(body: Node2D) -> void:
	if !disabled:
		$AudioStreamPlayer.play()
		visible = false
		GameManager.crystal_collected_emit(number)
		disabled = true

func _on_animated_sprite_2d_frame_changed() -> void:
	match animated_sprite.frame:
		0:
			label.position.y = -7
		1:
			label.position.y += 2
		2:
			label.position.y -= 4
		3:
			label.position.y += 1
	
func load_data() -> void:
	disabled = false
	if number == 10:
		label.text = "V"
	elif number == 0:
		label.text = "F"
	else:
		label.text = str(number)
	animated_sprite.play(color)

func _on_stage_5_2_reset_crystal() -> void:
	load_data()

func _on_area_entered(area: Area2D) -> void:
	if !disabled:
		$AudioStreamPlayer.play()
		visible = false
		GameManager.crystal_collected_emit(number)
		disabled = true
