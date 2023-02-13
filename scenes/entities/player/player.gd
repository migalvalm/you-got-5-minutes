extends KinematicBody2D
class_name Player

# Custom-State Variables
export(int) var SPEED = 700
export(int) var MAX_SPEED = 100

# Runtime-State Variables
var velocity: Vector2

enum states {
	WALK,
}

func _physics_process(delta: float) -> void:
	process_movement(delta)

func process_movement(delta: float) -> void:
	velocity = move_and_slide(
		VelocityLibrary.apply_4_directions_movement(
			velocity,
			MAX_SPEED,
			SPEED,
			delta
		)
	)
