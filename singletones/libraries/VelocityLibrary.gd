### Velocity Pure Functions
extends Node2D

func apply_4_directions_movement(velocity, max_speed, speed_up, delta) -> Vector2:
	var velocity_axis = get_4_direction_input_axis()
	
	if velocity_axis == Vector2.ZERO:
		return apply_friction(
			velocity_axis,
			speed_up * delta
		)
	else:
		return apply_movement(
			velocity, 
			velocity_axis * speed_up * delta,
			max_speed
		)

func get_4_direction_input_axis() -> Vector2:
	var vel_x = int(Input.get_axis("left", "right"))
	var vel_y = int(Input.get_axis("up", "down"))
	
	return Vector2(vel_x, vel_y).normalized()

func apply_friction(velocity: Vector2, amount: float) -> Vector2:
	if velocity.length() > amount: return velocity.normalized() * amount
	else: return Vector2.ZERO

func apply_movement(velocity, speed_up, max_speed) -> Vector2:
		velocity += speed_up
		return velocity.limit_length(max_speed)
