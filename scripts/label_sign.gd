extends Area2D

@export var text: String
@export var flip_horizontal: bool

func _ready() -> void:
	$Label.text = text
	if flip_horizontal:
		$Sprite2D.flip_h = true

func _on_body_entered(body: Node2D) -> void:
	$Label.visible = true


func _on_body_exited(body: Node2D) -> void:
	$Label.visible = false
	
func set_text(text: String) -> void:
	$Label.text = text
