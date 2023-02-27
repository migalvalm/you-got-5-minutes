extends Node2D
class_name EnemySpawner

onready var timer: Timer = get_node("Timer")

export(Array) var enemy_list: Array;
export(int) var batch_size: int = 3
export(float) var batch_spawn_rate: float = 2.5

var spawned = 0

func _init(
		_batch_size: int = batch_size,
		_batch_spawn_rate: float = batch_spawn_rate,
		_enemy_list: Array = [Globals.ENEMIES.Skull]
	) -> void:

	randomize()
	
	
	batch_size = _batch_size
	batch_spawn_rate = _batch_spawn_rate
	enemy_list = _enemy_list

func _physics_process(delta: float) -> void:
	if timer.is_stopped(): timer.start(batch_spawn_rate)

func spawn_batch(batch_size: int) -> void:
	var batch_locations: Array = []

	for i in range(batch_size):
		var random_pos = generate_random_position(batch_locations)
		batch_locations.push_back(random_pos)
	
	for pos in batch_locations:
		var enemy = instance_enemy(pos)
		get_parent().add_child(enemy) 
		
	spawned += 3

func instance_enemy(random_pos) -> Enemy:
		var enemy = enemy_list[randi() % enemy_list.size()].instance()
		enemy.set_position(random_pos)
		
		return enemy

func generate_random_position(batch_locations) -> Vector2:
	var random_pos = Vector2(
		randi() % SceneManager.current_scene.width+50, 
		randi() % SceneManager.current_scene.height+50
	)
	
	if batch_locations.has(random_pos): generate_random_position(batch_locations)
	
	return random_pos


func on_timeout() -> void:
	spawn_batch(batch_size)
