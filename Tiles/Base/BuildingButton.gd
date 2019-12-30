extends TextureButton

func _ready():
	darken()

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			darken()
		else:
			highlight()

func _on_mouse_entered():
	highlight()

func _on_mouse_exited():
	darken()
	
func highlight():
	modulate = Color8(255, 255, 255, 255)
	
func darken():
	modulate = Color8(230, 230, 230, 255)
