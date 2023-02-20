extends Node

var decoration_list: Array

## Room Generator Function
func generate_room(tile_floor, tile_wall, tile_decoration, width: int, height: int) -> void:
	generate_floor_tile(tile_floor, width, height)
	generate_wall_tile(tile_wall, width, height)
	generate_decoration_tile(tile_decoration, height, width)

## Generators Functions
static func generate_floor_tile(tilemap, width: int, height: int) -> void:
	for x in width:
		for y in height:
			place_cell(x, y, tilemap.TILES_ID, tilemap)

static func generate_wall_tile(tilemap, width: int, height: int) -> void:
	randomize()

	place_walls(width, height, tilemap)
	place_corners(width, height, tilemap)

func generate_decoration_tile(tilemap, width:int, height:int) -> void:
	randomize()
	
	for decoration in tilemap.AMOUNT:
		var random_pos: Vector2 = random_spawn_position(height, width)
		place_cell(int(random_pos.x), -int(random_pos.y), tilemap.TILES_ID, tilemap)

## Procedural Wall Generation Helpers
static func place_corners(width, height, tilemap):
	place_cell(0, 0, tilemap.CORNER_LEFT_TOP, tilemap)
	place_cell(width, 0, tilemap.CORNER_RIGHT_TOP, tilemap)
	place_cell(0, height, tilemap.CORNER_LEFT_BOTTOM, tilemap)
	place_cell(width, height, tilemap.CORNER_RIGHT_BOTTOM, tilemap)

static func place_walls(width, height, tilemap):
	for x in width:
		#Fill Top 
		place_cell(x, 0, tilemap.MIDDLE_TOP_BOT, tilemap)
		#Fill Bottom
		place_cell(x, height, tilemap.MIDDLE_TOP_BOT, tilemap)
	for y in height:
		#Fill Left Side
		place_cell(0, y, tilemap.MIDDLE_LEFT, tilemap)
		#Fill Right Side
		place_cell(height, y, tilemap.MIDDLE_RIGHT, tilemap)

## General Helpers
func random_spawn_position(width: int, height: int) -> Vector2:
	var random_pos: Vector2 = Vector2(randi() % width, -(randi() % width))
	
	if decoration_list.has(random_pos): return random_spawn_position(width, height)
	else:
		decoration_list.push_back(random_pos)
	
	return random_pos

static func place_cell(x: int, y: int, tiles: Array, tilemap) -> void:
	tilemap.set_cell(x, y, tiles[randi() % tiles.size()])
