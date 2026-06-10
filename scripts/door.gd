extends Area2D

@export var correct_door: bool
var open = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and has_overlapping_bodies():
		if !open:
			if correct_door:
				$AnimationPlayer.play("open_door")
			else:
				GameManager.stage_points -= 100
			open = true
		
