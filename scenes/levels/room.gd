extends YSort
class_name BaseRoom

onready var tile_floor: TileMap = get_node("%Floor")
onready var tile_floor_decoration: TileMap = get_node("%FloorDecoration")
onready var tile_wall: TileMap = get_node("%Walls")
onready var tile_decoration: TileMap = get_node("%Decoration")

export(int) var width: int
export(int) var height: int

# Runtime Instances
onready var enemy_spawner: PackedScene = load(Globals.ENEMY_SPAWNER)
onready var procedural_generator: ProceduralGeneration = ProceduralGeneration.new()

var total_monster: int

func _init(_width:int = 8, _height:int = 8) -> void:
	randomize()
	
	width = _width
	height = _height

func _ready() -> void:
	procedural_generator.generate_room(
		tile_floor,
		tile_wall,
		tile_decoration,
		tile_floor_decoration,
		width,
		height
	)
	
	add_child(enemy_spawner.instance())
	PlayerStore.spawn_player(self, tile_wall)
