extends Weapon
class_name Sword

func _input(event) -> void:
	match event.get_class():
		"InputEventMouseButton":
			process_mouse_click(event)

func process_mouse_click(mouse_event):
	match mouse_event.button_index:
		BUTTON_LEFT:
			if !animation.is_playing():
				animation.playback_speed = weapon_speed
				animation.play("attack")
		BUTTON_RIGHT:
			print("block")
			#todo

func on_hit(body: Node) -> void:
	print(body.name)
