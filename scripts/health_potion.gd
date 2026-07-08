extends Area2D

var disabled : bool

func _on_body_entered(body: Node2D) -> void:
	if !disabled:
		var health_restored
		if body.max_health - body.health > 4:
			health_restored = 4
		else:
			health_restored = body.max_health - body.health
		body.health += health_restored
		GameManager.player_took_damage(-health_restored, body.max_health, body.health)
		$AudioStreamPlayer.play()
		visible = false
		disabled = true

func _on_audio_stream_player_finished() -> void:
	queue_free()
