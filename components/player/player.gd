extends KinematicBody2D
class_name Player

# Custom-State Variables
export(int) var SPEED_UP = 2000
export(int) var SPEED = 100

# Runtime-State Variables
var velocity: Vector2
var speed_velocity: Vector2

enum states {
	WALK,
}

func _physics_process(delta: float) -> void:
	velocity = move_and_slide(
		PlayerLibrary.apply_4_directions_movement(
			velocity,
			SPEED,
			SPEED_UP,
			delta
		)
	)

