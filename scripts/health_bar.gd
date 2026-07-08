extends Control

#var health_bar_size = $red_bar.region_rect.w

func _ready() -> void:
	GameManager.connect("took_damage", update_health_bar)

func update_health_bar(damage: int, max_health: int, current_health: int) -> void:
	if damage > 0:
		$AnimationPlayer.play("take_damage");
	var health_lost = max_health - current_health
	var new_bar = Rect2(336 + int(16 * (health_lost/float(max_health))), 64, 16, 4)
	$red_bar.region_rect = new_bar
	
