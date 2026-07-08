extends Area2D

@export var number: int
@export var color: String
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $Label
var disabled : bool

func _ready() -> void:
	load_data()
	GameManager.connect("update_crystals", load_data)

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

func _on_audio_stream_player_finished() -> void:
	queue_free()
	
func load_data() -> void:
	label.text = str(number)
	animated_sprite.play(color)
