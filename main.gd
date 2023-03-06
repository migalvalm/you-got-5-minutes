extends Node2D

var room_ref

func _ready() -> void:
	GameController.start_game()
	
	room_ref = GameController.room_no

func _physics_process(delta: float) -> void:
	print(room_ref)
