extends YSort

onready var tile_floor: TileMap = get_node("%Floor")
onready var tile_floor_decoration: TileMap = get_node("%FloorDecoration")
onready var tile_wall: TileMap = get_node("%Walls")
onready var tile_decoration: TileMap = get_node("%Decoration")

export(int) var width: int
export(int) var height: int
export(int) var enemy_count: int = 20

# Runtime Instances
onready var enemy_spawner: EnemySpawner = EnemySpawner.new(enemy_count)
onready var procedural_generator: ProceduralGeneration = ProceduralGeneration.new()

func _ready() -> void:
	PlayerStore.spawn_player(self, tile_wall)
	
	procedural_generator.generate_room(
		tile_floor,
		tile_wall,
		tile_decoration,
		tile_floor_decoration,
		width,
		height
	)
	
func _physics_process(delta: float) -> void:
	enemy_spawner.spawn_enemy(self)
	

func _input(event) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	if Input.is_action_pressed("refresh"):
		get_tree().change_scene(Globals.LEVELS.Test)
