extends Node2D


var selected_tile

func _ready():
	for tile in $Hexes.get_children():
		tile.connect("menu_opened", self, "tile_selected")
		tile.connect("menu_closed", self, "tile_deselected")
		
func tile_selected(tile):
	if selected_tile:
		selected_tile.close_menu()
	selected_tile = tile
	
func tile_deselected(tile):
	selected_tile = null
	
func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		if selected_tile:
			selected_tile.close_menu()
		selected_tile = null