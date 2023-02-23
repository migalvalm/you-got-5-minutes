extends Node2D

onready var tile_floor: TileMap = get_node("%Floor")
onready var tile_floor_decoration: TileMap = get_node("%FloorDecoration")
onready var tile_wall: TileMap = get_node("%Walls")
onready var tile_decoration: TileMap = get_node("%Decoration")

export(int) var width
export(int) var height


func _ready() -> void:
	ProceduralGeneration.generate_room(
		tile_floor,
		tile_wall,
		tile_decoration,
		tile_floor_decoration,
		width,
		height
	)
