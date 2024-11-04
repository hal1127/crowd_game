extends Area2D

func _on_area_exited(area):
	if area.name.find("Rock") != -1:
		area.direction.x *= -1
		area.direction.y *= -1
