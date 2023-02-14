extends Node2D

onready var tile: TileMap = get_node("Floor")

export(float) var grid_size = 8.0
export(PackedScene) var tree_scene
export(int) var tree_amount
export(int) var decoration_tile_amount
export(int) var x_size
export(int) var y_size

var decoration_list: Array
var position_list: Array

func _ready() -> void:
	randomize()
	generate_base_tile(x_size, y_size)
	
func generate_base_tile(width: int, height: int) -> void:
	for x in width:
		for y in height:
			tile.set_cell(x, y, 0)
			
	generate_decoration_tile()

func generate_decoration_tile() -> void:
	for decoration in decoration_tile_amount:
		var random_pos: Vector2 = random_spawn_position(x_size, y_size)
		
		# 5 is max_id
		print(random_pos)
		tile.set_cell(random_pos.x, -random_pos.y, [2,3,4,5][randi() % 3])
		
func random_spawn_position(width: int, height: int) -> Vector2:
	var x_pos: int = randi() % width
	var y_pos: int = -(randi() % width)
	
	if decoration_list.has(Vector2(x_pos, y_pos)): return random_spawn_position(width, height)
	else:
		decoration_list.push_back(Vector2(x_pos, y_pos))
		
		return Vector2(x_pos, y_pos)

