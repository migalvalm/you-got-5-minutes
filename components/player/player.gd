extends KinematicBody2D
class_name Player

# Custom-State Variables
export(int) var SPEED = 100

# Runtime-State Variables
var velocity: Vector2
var speed_velocity: Vector2

enum states {
	WALK,
}

func _physics_process(_delta: float) -> void:
	speed_velocity = move_and_slide(velocity.normalized() * SPEED)

func _input(_event: InputEvent) -> void:
	velocity = PL.get_4_directions_input()
