extends TextureButton

var building_scene

func _ready():
	modulate = Color8(230, 230, 230, 255)
	
func init(image, scene):
	texture_normal = image
	scene = building_scene

func _on_mouse_entered():
	modulate = Color8(255, 255, 255, 255)

func _on_mouse_exited():
	modulate = Color8(230, 230, 230, 255)
