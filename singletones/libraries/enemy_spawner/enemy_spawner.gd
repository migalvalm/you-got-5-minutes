extends Node2D
class_name EnemySpawner

var max_entities = 10
var spawned = 0
var enemy_list: Array = [Globals.ENEMIES.Skull]

func _init(
		max_entities:int = max_entities, 
		enemy_list:Array = enemy_list
	) -> void:
		
	randomize()
	
	max_entities = max_entities

func spawn_enemy(room):
	if spawned < max_entities:
		var random_pos: Vector2 = Vector2(
			randi() % room.width+50, 
			randi() % room.height+50
			)
		
		print(random_pos)
		var enemy = enemy_list[randi() % enemy_list.size()].instance()
		enemy.set_position(random_pos)
		
		room.add_child(enemy) 
		spawned += 1
