extends KinematicBody2D
class_name Player

# Child Nodes
onready var CAMERA: Camera2D = get_node("Camera")

# Player Camera Variables - 16x16 Default
export (Vector2) var CAMERA_ZOOM = Vector2(0.8, 0.8)

# Custom-State Variables
export(int) var SPEED = 700
export(int) var MAX_SPEED = 100

# Runtime-State Variables
var velocity: Vector2
var camera: Camera2D

enum states {
	WALK,
}

func _ready():
	set_camera()

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

func set_camera() -> void:
	CAMERA.limit_left = 0
	CAMERA.limit_top = 0
	CAMERA.limit_right = 8 * get_parent().width + 8
	CAMERA.limit_bottom = 8 * get_parent().height + 8
	CAMERA.zoom = CAMERA_ZOOM
