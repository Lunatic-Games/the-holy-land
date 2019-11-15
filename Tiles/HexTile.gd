extends Area2D

func _ready():
	pass
	

func _on_HexTile_mouse_entered():
	$Hovered.visible = true


func _on_HexTile_mouse_exited():
	$Hovered.visible = false
