extends Node2D

export(NodePath) onready var player = get_node(player) as KinematicBody2D

var current_weapon: Weapon = null
var weapons: Array = [
	Globals.WEAPONS.Sword, null, null
]

func _input(event) -> void:
	if event.is_action_pressed("equip"):
		switch_weapon(event.as_text().to_int())

func switch_weapon(slot):
	if current_weapon: player.remove_child(current_weapon)
	current_weapon = weapons[slot-1].instance()
	if current_weapon: player.add_child(current_weapon)
