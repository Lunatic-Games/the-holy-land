extends Area2D



func _on_mouse_entered():
	$HoveredSprite.visible = true


func _on_mouse_exited():
	$HoveredSprite.visible = false
