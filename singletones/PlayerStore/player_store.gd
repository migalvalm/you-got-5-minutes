extends Node2D

var player_ref: Player

var player_level: int = 0;

var stats: Dictionary = {
	"health": "100",
	"movement_speed": "500",
	"weapons_buffs": {
		"melee_weapon": {
			"damage": "5",
			"attack_speed": "1.0"
		},
		"range_weapon": {
			"damage": "7",
			"attack_speed": "0.8"
		}
	}
}

func spawn_player(room: Node2D, child_tile: Node2D) -> void:
	player_ref = Globals.PLAYER.instance()
	player_ref.set_position(Vector2(room.width+10, room.height+20))
	
	room.add_child_below_node(child_tile, player_ref) 
