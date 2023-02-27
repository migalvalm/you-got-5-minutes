extends Node2D

var current_level: Node2D
var time: float = 5.0
var room_no: int = 0
var player_kills: int = 0

func start_game() -> void:
	generate_room()

func end_game() -> void:
	SceneManager.goto_scene("")
	
func change_room() -> void:
	pass
	
func generate_room() -> void:
	SceneManager.goto_scene(Globals.LEVELS.Test)
	current_level = SceneManager.current_scene

func generate_room_states() -> void:
	pass

func _input(_event) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	if Input.is_action_pressed("refresh"):
		GameController.start_game()
