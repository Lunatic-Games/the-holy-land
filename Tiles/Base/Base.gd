extends Area2D

export(Array, String, FILE, "*.tscn") var tile_scenes
export(Array, Resource) var tile_images
export(int) var build_time = 1
var active = true

func _ready():
	for child in $PanelContainer/Sections/Buildings.get_children():
		child.queue_free()
	
	for i in range(len(tile_scenes)):
		var button = load("res://Tiles/Base/BuildingButton.tscn").instance()
		button.texture_normal = tile_images[i]
		button.connect("button_up", self, "change_tile", [tile_scenes[i]])
		$PanelContainer/Sections/Buildings.add_child(button)
		
func _on_mouse_entered():
	$HoveredSprite.visible = true

func _on_mouse_exited():
	$HoveredSprite.visible = false

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		open_menu()
		
func close_menu():
	$PanelContainer.visible = false
	
func open_menu():
	$PanelContainer.visible = true
	
func change_tile(scene_file):
	var new_tile = load(scene_file).instance()
	new_tile.position = position
	new_tile.begin_building()
	get_parent().add_child_below_node(self, new_tile)
	get_parent().remove_child(self)
	queue_free()
	
func begin_building():
	$BuildingSprite.visible = true
	$Sprite.modulate = Color8(200, 200, 200, 255)
	$BuildTimer.wait_time = build_time
	$BuildTimer.start()
	
	
func finish_building():
	$BuildingSprite.visible = false
	$Sprite.modulate = Color8(255, 255, 255, 255)
	
func _unhandled_input(event):
	if event is InputEventMouseButton and not $HoveredSprite.visible:
		close_menu()