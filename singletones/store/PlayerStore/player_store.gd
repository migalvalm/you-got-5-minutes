extends Node2D

var player_ref: Player

func spawn_player(room: Node2D, child_tile: Node2D) -> void:
	player_ref = Globals.PLAYER.instance()
	player_ref.set_position(Vector2(room.width+10, room.height+20))
	
	room.add_child_below_node(child_tile, player_ref) 
