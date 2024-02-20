extends CharacterBody2D
@onready var animation_player = $AnimationPlayer
@onready var animated_sprite_2d = $AnimatedSprite2D

const GRAVITY: float = 1500.0
const VELOCITY: float = 200.0

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	movement()
	move_and_slide()
	animate()

func movement() -> void:
	if Input.is_action_pressed("right") == true:
		velocity.x = VELOCITY
	elif Input.is_action_pressed("left") == true:
		velocity.x = VELOCITY * -1
	else:
		velocity.x = 0.0

func animate() -> void:
	if velocity.x > 0 or velocity.x < 0:
		animated_sprite_2d.play("running")
	else:
		animated_sprite_2d.play("idle")
	
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true
	elif velocity.x > 0:
		animated_sprite_2d.flip_h = false
