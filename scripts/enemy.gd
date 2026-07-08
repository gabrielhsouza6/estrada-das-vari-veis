extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var right_arrow: RayCast2D = $right_arrow
@onready var left_arrow: RayCast2D = $left_arrow
var attacking = false
@export var direction: int
var previous_direction: int
var damage = 2
var speed = 100

func _ready() -> void:
	if direction == 0:
		direction = 1

func _process(delta: float) -> void:
	if has_overlapping_bodies():
		for body in get_overlapping_bodies():
			if body.has_method("take_damage"):
				attacking = true
	
	if attacking:
		animated_sprite.play("attack")
		direction = 0
	else:
		if left_arrow.is_colliding():
			direction = 1
		if right_arrow.is_colliding():
			direction = -1
		animated_sprite.play("walk")
	if direction == -1:
		animated_sprite.flip_h = true
	elif direction == 1:
		animated_sprite.flip_h = false
	
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
				

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "attack":
		attacking = false
		direction = previous_direction

func _on_animated_sprite_2d_frame_changed() -> void:
	if animated_sprite.animation == "attack" and animated_sprite.frame == 0:
		attack()

func _on_animated_sprite_2d_animation_changed() -> void:
	if animated_sprite.animation == "attack":
		previous_direction = direction
