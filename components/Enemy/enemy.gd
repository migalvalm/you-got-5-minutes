extends KinematicBody2D
class_name Enemy

onready var animation: AnimationPlayer = get_node("Animation")

# Custom-State Variables
export(int) var SPEED = 20
export(int) var COOLDOWN_TIME = 0.5

# Runtime State Variables
export(int) var health = 25
export(int) var enemy_damage = 5

var player_ref: Player = null
var can_hit = true


func _ready() -> void:
	player_ref = PlayerStore.player_ref
	
func _physics_process(delta: float) -> void:
	if not player_ref and is_alive(): player_ref = PlayerStore.player_ref
	
	if player_ref and is_alive():
		var velocity = global_position.direction_to(player_ref.global_position)
		move_and_collide(velocity * SPEED * delta)

func damage(value) -> void:
	if can_hit and player_ref:
		health -= value
		move_and_collide((get_global_mouse_position() - player_ref.global_position).normalized() * value)
		
		if health <= 0:
			die()
		else:
			hurt()

func hurt() -> void:
	animation.play("hurt")
	can_hit = false
	
	yield(
		get_tree().create_timer(COOLDOWN_TIME),
		"timeout"
	)
	
	can_hit = true
	
func die() -> void:
	player_ref = null
	animation.play("die")

func is_alive() -> bool:
	return health > 0
