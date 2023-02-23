extends Node

var floor_decoration_list: Array
var decoration_list: Array
var corner_list: Array
var wall_list: Array

## Room Generator Function
func generate_room(tile_floor, tile_wall, tile_decoration, tile_floor_decoration, width: int, height: int) -> void:
	corner_list = []
	wall_list= []
	
	generate_floor_tile(tile_floor, width, height)
	generate_floor_decoration_tile(tile_floor_decoration, width, height)
	generate_wall_tile(tile_wall, width, height)
	generate_decoration_tile(tile_decoration, height, width)

## Generators Functions
static func generate_floor_tile(tilemap, width: int, height: int) -> void:
	for x in width:
		for y in height:
			place_cell(x, y, tilemap.TILES_ID, tilemap)
			

func generate_floor_decoration_tile(tilemap, width: int, height: int) -> void:
	for decoration in tilemap.AMOUNT:
		var random_pos: Vector2 = random_spawn_position(height, width, floor_decoration_list)
		place_cell(int(random_pos.x), -int(random_pos.y), tilemap.TILES_ID, tilemap)
		
func generate_wall_tile(tilemap, width: int, height: int) -> void:
	randomize()

	place_walls(width, height, tilemap)
	place_corners(width, height, tilemap)

func generate_decoration_tile(tilemap, width:int, height:int) -> void:
	randomize()
	
	for decoration in tilemap.AMOUNT:
		var random_pos: Vector2 = random_spawn_position(height, width, decoration_list)
		place_cell(int(random_pos.x), -int(random_pos.y), tilemap.TILES_ID, tilemap)

## Procedural Wall Generation Helpers
func place_corners(width, height, tilemap):
	place_cell(0, 0, tilemap.CORNER_LEFT_TOP, tilemap)
	place_cell(width, 0, tilemap.CORNER_RIGHT_TOP, tilemap)
	place_cell(0, height, tilemap.CORNER_LEFT_BOTTOM, tilemap)
	place_cell(width, height, tilemap.CORNER_RIGHT_BOTTOM, tilemap)
	
	corner_list.append_array([
		Vector2(0,0),
		Vector2(width, 0),
		Vector2(0, height),
		Vector2(width, height)
	])

func place_walls(width, height, tilemap):
	for x in width:
		#Fill Top 
		place_cell(x, 0, tilemap.MIDDLE_TOP_BOT, tilemap)
		wall_list.push_back(Vector2(x,0))
		#Fill Bottom
		place_cell(x, height, tilemap.MIDDLE_TOP_BOT, tilemap)
		wall_list.push_back(Vector2(x,height))
	for y in height:
		#Fill Left Side
		place_cell(0, y, tilemap.MIDDLE_LEFT, tilemap)
		wall_list.push_back(Vector2(0,y))
		#Fill Right Side
		place_cell(height, y, tilemap.MIDDLE_RIGHT, tilemap)
		wall_list.push_back(Vector2(height,y))

## General Helpers
func random_spawn_position(width: int, height: int, target_list: Array) -> Vector2:
	var random_pos: Vector2 = Vector2(randi() % width, -(randi() % width))
	
	if check_cell(random_pos, target_list): random_spawn_position(width, height, target_list)
	else:
		target_list.push_back(random_pos)
	
	return random_pos

static func place_cell(x: int, y: int, tiles: Array, tilemap) -> void:
	tilemap.set_cell(x, y, tiles[randi() % tiles.size()])

func check_cell(pos, target_list: Array) -> bool:
	return corner_list.has(pos)  || wall_list.has(pos) || target_list.has(pos)
