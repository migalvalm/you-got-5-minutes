extends Node2D
class_name Weapon

onready var main_texture = get_node("MainTexture")
onready var animation = get_node("Animation")

export(int) var weapon_range: int = 10
export(int) var weapon_damage: int = 5
export(int) var weapon_speed: float = 2.0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	Input.set_custom_mouse_cursor(preload("res://assets/Graphics/1x1transparent.png"))

func _physics_process(_delta: float) -> void: 
	process_mouse()

# Override this function to define different events based on weapon
func _input(_event) -> void:
	pass

# Override this function to define different events based on weapon
func process_mouse_click(_mouse_event):
	pass

func process_mouse():
	var mouse_direction: Vector2 = get_mouse_direction()
	
	flip_weapon(mouse_direction)
		
	rotation = mouse_direction.angle()
	position = mouse_direction


func flip_weapon(mouse_direction: Vector2) -> void:
	if main_texture.scale.y > 0 and mouse_direction.x < 0: main_texture.scale.y = -main_texture.scale.y
	elif main_texture.scale.y < 0 and mouse_direction.x > 0: main_texture.scale.y = -(main_texture.scale.y)

func get_mouse_direction() -> Vector2:
	return (get_global_mouse_position() - get_parent().global_position).normalized() * weapon_range
