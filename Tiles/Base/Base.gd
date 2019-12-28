extends Area2D

export(Array, String, FILE) var buildable
export(Array, Resource) var images
 
func _ready():
	for image in images:
		var button = load("res://Tiles/Base/BuildingButton.tscn").instance()
		button.init(image, null)
		button.connect("button_up", self, "building")
		$PanelContainer/Sections/Buildings.add_child(button)
		
func _on_mouse_entered():
	$HoveredSprite.visible = true

func _on_mouse_exited():
	$HoveredSprite.visible = false

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		open_menu()
		
func close_menu():
	$PanelContainer.visible = false
	
func open_menu():
	$PanelContainer.visible = true
	
func building():
	$BuildingSprite.visible = true
	$Sprite.modulate = Color8(200, 200, 200, 255)
	close_menu()
	
func finish_building():
	$BuildingSprite.visible = false
	$Sprite.modulate = Color8(255, 255, 255, 255)
	
func _unhandled_input(event):
	if event is InputEventMouseButton and not $HoveredSprite.visible:
		close_menu()