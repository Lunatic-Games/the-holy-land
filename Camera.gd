extends Camera2D


var zoom_modifier = 1.03 # Should probably be between 1.01 and 1.2
var camera_move_speed = 350

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == BUTTON_WHEEL_UP:
			if zoom.x / zoom_modifier >= 0.1:
				zoom.x /= zoom_modifier
				zoom.y /= zoom_modifier
		elif event.button_index == BUTTON_WHEEL_DOWN:
			if zoom.x * zoom_modifier <= 4:
				zoom.x *= zoom_modifier
				zoom.y *= zoom_modifier
				
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