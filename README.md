### Currently learning GDScript 2.0 and Godot 4.0 so I can update this project to a more recent version of Godot!

## Dependencies
- ### Godot 3.5
- ### GDScript 1.0

## Generated Theme

- The World Will End In Five Minutes

## Genre

- Roguelike (or rogue-like)
	- is a subgenre of role-playing computer games traditionally characterized by **a dungeon crawl through procedurally generated levels, turn-based gameplay, grid-based movement, and permanent death of the player character**.
- Slice 'em up

## Gameplay Type

- Dungeon Crawler
- Melee Weapons
- Range Attacks (Magic, Bow)
- Time rac

## Assets

- [Micro-Roguelike](https://www.kenney.nl/assets/micro-roguelike)
	- 8x8
	- Contains:
		- Walls
		- Enemies
		- Items
		- Interface
		- Elements
		- Player

## Singletones

- ### Velocity Library (`VelocityLibrary.tscn`)
*Singletone to deal with the movement calculations and input handling for it*

The movement actions need to be set to: `"left", "right", "up", "down"`

- ### Procedural Map Generation (`ProceduralGeneration.tscn`)
*Singletone that has the pure functions to generate walls, floors and decoration*

The tilemap node passed on to the `ProceduralGeneration` function (`generate_room`) needs to have the following variables defined

#### Floor Node Tilemap:
- Variables
	- Floor Tiles (`TILES_ID`)
		An array for the IDs of each tile

#### Walls Node Tilemap:
- Variables
	- Corner Left Top (`CORNER_LEFT_TOP`)
		An array of IDs 
	- Floor Tiles (`CORNER_RIGHT_TOP`)
		An array of IDs 
	- Floor Tiles (`CORNER_LEFT_BOTTOM`)
		An array of IDs 
	- Floor Tiles (`CORNER_RIGHT_BOTTOM`)
		An array of IDs 
	- Floor Tiles (`MIDDLE_TOP_BOT`)
		An array of IDs 
	- Floor Tiles (`MIDDLE_LEFT`)
		An array of IDs 
	- Floor Tiles (`MIDDLE_RIGHT`)
		An array of IDs 

#### Decoration Node Tilemap:
- Variables
	- Tiles Id (`TILES_ID`)
		An array for the IDs of each decoration tile
	- Amount (`AMOUNT`)
		Define amount of this decoration to be rendered
