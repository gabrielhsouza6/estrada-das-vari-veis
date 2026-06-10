extends Area2D

@export var number: int
@export var color: String
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $Label

func _ready() -> void:
	label.text = str(number)
	animated_sprite.play(color)

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(2)
	queue_free()
	

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
	
	
