extends Control

export(float) var grid_size = 16.0
export(Color) var line_color
export(int) var width
export(int) var height
export(int, 0, 10, 1) var line_width

func _ready() -> void:
	width = width/grid_size
	height = height/grid_size
	
	
func _draw():
	for step in height + 1:
		draw_line(
			Vector2(0, step) * grid_size, 
			Vector2(width, step) * grid_size,
			line_color,
			line_width
		)

	for step in width + 1:
		draw_line(
			Vector2(step, 0) * grid_size,
			Vector2(step, height) * grid_size,
			line_color,
			line_width
		)
