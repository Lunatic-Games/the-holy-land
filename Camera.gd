extends Camera2D


var zoom_modifier = 1.03 # Should probably be between 1.01 and 1.2
var camera_move_speed = 350

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == BUTTON_WHEEL_UP:
			if zoom.x / zoom_modifier >= 0.1:
				zoom(1 / zoom_modifier)
		elif event.button_index == BUTTON_WHEEL_DOWN:
			if zoom.x * zoom_modifier <= 4:
				zoom(zoom_modifier)
				

func zoom(modifier):
	var dist_from_center = get_viewport_rect().size / 2 - get_viewport().get_mouse_position()
	var old_zoom = zoom.x
	zoom.x *= modifier
	zoom.y *= modifier
	position += dist_from_center * (zoom.x - old_zoom)
				
func _process(delta):
	var movement = Vector2()
	if Input.is_action_pressed("ui_up"):
		movement.y -= camera_move_speed
	if Input.is_action_pressed("ui_right"):
		movement.x += camera_move_speed
	if Input.is_action_pressed("ui_down"):
		movement.y += camera_move_speed
	if Input.is_action_pressed("ui_left"):
		movement.x -= camera_move_speed
	position += movement.normalized() * camera_move_speed * delta