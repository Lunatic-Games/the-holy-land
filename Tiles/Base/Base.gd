extends Area2D

signal menu_opened
signal menu_closed

export(Array, String, FILE) var buildable
export(Array, Resource) var images
 
func _ready():
	for image in images:
		var text_rect = TextureRect.new()
		text_rect.rect_scale = Vector2(0.5, 0.5)
		text_rect.texture = image
		$PanelContainer/Sections/Buildings.add_child(text_rect)
		
func _on_mouse_entered():
	$HoveredSprite.visible = true

func _on_mouse_exited():
	$HoveredSprite.visible = false

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		open_menu()
		
func close_menu():
	emit_signal("menu_closed", self)
	$PanelContainer.visible = false
	
func open_menu():
	emit_signal("menu_opened", self)
	$PanelContainer.visible = true
