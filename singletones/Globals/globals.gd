extends Node2D

const WEAPONS = {
	"Sword": preload("res://scenes/entities/weapons/sword/sword.tscn")
}

const ENEMIES = {
	"Skull": preload("res://scenes/entities/enemies/skull/skull.tscn")
}

const LEVELS = {
	"Test": "res://scenes/levels/room.tscn"
}

const PLAYER = preload("res://scenes/entities/player/player.tscn")

const ENEMY_SPAWNER = "res://components/Spawner/enemy_spawner.tscn"
