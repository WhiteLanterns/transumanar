extends Node3D

@export_range(2, 20) var grid_size: int = 10
const TILE_SIZE := 1.71
const HEX_TILE = preload("res://assets/hexagon.tscn")
const TILE_MATS = [
	preload("res://assets/blue.tres"),
	preload("res://assets/green.tres"),
	preload("res://assets/red.tres"),
	preload("res://assets/yellow.tres"),
]

func _ready() -> void:
	_generate_grid()
	
func _generate_grid():
	var tile_index := 0
	for x in range(grid_size):
		var tile_coords := Vector2.ZERO
		tile_coords.x = x * TILE_SIZE * cos(deg_to_rad(30))
		@warning_ignore("incompatible_ternary")
		tile_coords.y = 0 if x % 2 == 0 else TILE_SIZE / 2
		for y in range(grid_size):
			var tile = HEX_TILE.instantiate()
			add_child(tile)
			tile.translate(Vector3(tile_coords.x, 0, tile_coords.y))
			tile_coords.y += TILE_SIZE
			tile.get_node("Cylinder").material_override = get_tile_mat(tile_index)
			tile_index += 1

func get_tile_mat(tile_index: int):
	var index = tile_index % TILE_MATS.size()
	return TILE_MATS[index]
