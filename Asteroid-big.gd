extends "res://Asteroid.gd"

var a = preload("res://Asteroid-small.tscn")

func _on_Area2D_area_entered(area):
	for i in range(randi() % 4 + 1):
		var s = a.instance()
		get_parent().add_child(s)
		print(area.get_parent().position)
		s.position = area.get_parent().position
	queue_free()
