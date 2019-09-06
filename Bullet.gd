extends Node2D

var screen_size
var velocity = Vector2(1,0)

func _ready():
	screen_size = get_viewport_rect().size
	
	
func _process(delta):
	position += velocity * 1000 * delta
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
	
func _on_Area2D_area_entered(area):
	area.get_parent().queue_free()
	queue_free()

func _on_Timer_timeout():
	queue_free()
