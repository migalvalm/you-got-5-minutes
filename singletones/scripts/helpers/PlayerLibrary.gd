### Player Generic Functions Library
extends Node

func calculate_velocity(vel_x: float, vel_y: float) -> Vector2:
	return Vector2(vel_x, vel_y)

func get_4_directions_input() -> Vector2:
	var vel_x = Input.get_action_strength("right") - Input.get_action_strength("left")
	var vel_y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	return calculate_velocity(vel_x, vel_y)
	
