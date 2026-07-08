extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var right_arrow: RayCast2D = $right_arrow
@onready var left_arrow: RayCast2D = $left_arrow
@export var attacking = false
@export var direction: int
@export var previous_direction: int
@export var enemy_name: String
var damage = 2
var speed = 100

func _ready() -> void:
	sprite.texture = load("res://Assets/character_assets/enemies/" + enemy_name + ".png")
	if direction == 0:
		direction = 1

func _process(delta: float) -> void:
	if has_overlapping_bodies():
		for body in get_overlapping_bodies():
			if body.has_method("take_damage"):
				attacking = true
	
	if direction != 0:
		previous_direction = direction
	
	if attacking:
		animation_player.play("attack")
		direction = 0
	else:
		if left_arrow.is_colliding():
			direction = 1
		if right_arrow.is_colliding():
			direction = -1
		animation_player.play("walk")
	if direction == -1:
		sprite.flip_h = true
	elif direction == 1:
		sprite.flip_h = false
	
	position.x += direction * delta * speed
	#if name == "ghost":
		#print("left_arrow: " + str(left_arrow.is_colliding()))
		#print("right_arrow: " + str(right_arrow.is_colliding()))
		#print(direction)
		#print("attacking: " + str(attacking))
		#print("------------------")
	
func attack() -> void:
	if has_overlapping_bodies():
		for body in get_overlapping_bodies():
			if body.has_method("take_damage"):
				body.take_damage(damage)

func walk_away() -> void:
	direction = previous_direction

#func _on_animated_sprite_2d_animation_finished() -> void:
	#if animated_sprite.animation == "attack":
		#attacking = false
		#direction = previous_direction
#
#func _on_animated_sprite_2d_frame_changed() -> void:
	#if animated_sprite.animation == "attack" and animated_sprite.frame == 0:
		#attack()
#
#func _on_animated_sprite_2d_animation_changed() -> void:
	#if animated_sprite.animation == "attack":
		#previous_direction = direction
